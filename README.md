# Posh-Mailkit
Send an email using PowerShell and MailKit.

Requires MimeKit and MailKit

Install-Package -Name 'MimeKit' -Source "https://www.nuget.org/api/v2" -SkipDependencies

Install-Package -Name 'MailKit' -Source "https://www.nuget.org/api/v2"


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