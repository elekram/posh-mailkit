# Posh-Mailkit
Send an email using PowerShell and MailKit

## Settings.json example
```json
{
  "Email": {
    "Server": "smtp.gmail.com",
    "Port": "465",
    "IsSSL": "true",
    "Username": "someone@somedomain.com",
    "Password": "<some-secret-string>",
    "MimeKitDLL": "C:\\Program Files\\PackageManagement\\NuGet\\Packages\\MimeKit.3.4.1\\lib\\net47\\MimeKit.dll",
    "MailKitDLL": "C:\\Program Files\\PackageManagement\\NuGet\\Packages\\MailKit.3.4.1\\lib\\net47\\MailKit.dll"
  } 
} 
```