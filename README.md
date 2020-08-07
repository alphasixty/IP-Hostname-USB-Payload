# IP-Hostname-USB-Payload

ESPloit V2 Cactus WiFi/HID Payload - IP&Hostname Grab

This is formatted for ESPloit V2 by Corey Harding
[Resource for ESPloit](https://github.com/exploitagency/ESPloitV2)

Used on a WiFi Cactus

This payload uses Powershell to grab the current username and IP address of the victims workstation and then uses gmail to send it back to the target source email account.

The IP and Hostname payload is primarily used to enumerate users who plug in a rogue USB. It takes about 1.5 seconds to run, and if interrupted could fail to resolve.

At the end of the PSX script there is also a system message that alerts the user. Our use case was to return the USB to the proper point of contact but can be modified or removed. The raw PS1 is included as well. 

