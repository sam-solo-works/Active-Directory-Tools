#Get-ADGroup -Identity "VPN Remote Users" | Get-ADGroupMember | select Name | Export-Csv -NoTypeInformation -Path "C:\Users\ssolmonson\OneDrive - NAPA\Desktop\temp\VPNusers.csv" -Force
#run this top script in a separate script first then once its created its CSV run the second part.
$emails = @()

foreach ($user in (Get-Content -Path "C:\Users\Desktop\temp\VPNusers.csv")) {

$adUsers = Get-AdUser -Filter {(name -eq $user)}
if ($adUsers){
    Write-Host "Finding $user email."
    $emails += Get-ADUser -Filter * | where -Property Name -Like $user | select UserPrincipalName
    write-Host "Email found."
    } 
else{
    Write-Host "$user was not found in AD."
    }
}

$emails | Export-Csv -NoTypeInformation -Path "C:\Users\Desktop\temp\VPNusersEmails.csv" -Force