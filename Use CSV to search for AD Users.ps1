foreach ($user in (Import-Csv -Path "C:\Users\temp\VPNusers.csv")) {
    $Name = $user
    $SurName = $user.SurName
    $UPN =$user.UPN

$adUsers = Get-AdUser -Filter {(givenname -eq $GivenName) -and (surname -eq $SurName)}
if ($adUsers){
$adUsers | select -Property GivenName, SurName, UserPrincipalName | Format-Table -AutoSize -Wrap
    }
else{
Write-Host "$GivenName $Surname was not found in AD."
    }
}