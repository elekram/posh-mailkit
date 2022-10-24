$Settings = Get-Content -Raw -Path .\config\settings.json | ConvertFrom-Json
Import-Module .\Write-LogEntry.psm1 -Force -Scope Local

Add-Type -Path $settings.Email.MailKitDLL
Add-Type -Path $settings.Email.MimeKitDLL

$SMTPServer = $settings.Email.server
$SMTPPort = $settings.Email.port
$isSSL = $settings.Email.isSSL

$username = $settings.Email.username
$password = $settings.Email.password

function Send-Email($EmailProperties) {
  $SMTPClient = New-Object MailKit.Net.Smtp.SmtpClient
  $Message = New-Object MimeKit.MimeMessage
  $TextPart = New-Object MimeKit.TextPart('html')

  $from = $username
  $to = $EmailProperties.to
  $cc = $EmailProperties.cc
  
  $TextPart.Text = $EmailProperties.Body

  $Message.From.Add($from)
  $Message.To.Add($to)

  if ($cc) {
    $Message.Cc.Add($cc)
  }
  

  $Message.Subject = $EmailProperties.subject
  $Message.Body = $TextPart

  try {
    $SMTPClient.Connect($SMTPServer, $SMTPPort, $isSSL)
    $SMTPClient.Authenticate($username, $password)

    $res = $SMTPClient.Send($Message)
    
    Write-LogEntry -Type 'Send-Email' -Status 'Success' -Message $res
    $SMTPClient.Disconnect($true)
    return $res
  } catch {
    $err = $_.Exception.Message
    Write-LogEntry -Type 'Send-Email' -Status 'Fail' -Message $err
  }
}