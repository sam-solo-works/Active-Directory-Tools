#create COM object named Outlook
$Outlook = New-Object -ComObject Outlook.Application 
#create Outlook MailItem named Mail using CreateItem() method
$Mail = $Outlook.CreateItem(0)
#add properties as desired
$Mail.To = "test@test.com"
$Mail.Subject = "subject"
$Mail.Body = "testing"
#send message
Send-MailMessage $Mail.Send() 
#quit and cleanup
$Outlook.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($Outlook) | Out-Null
