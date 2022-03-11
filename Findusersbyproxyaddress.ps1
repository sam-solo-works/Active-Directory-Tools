$VerbosePreference = 'continue'
$FilePath = "C:\temp\test\file3.csv"

$results = foreach ($u in ($Users = Import-csv "C:\temp\test\2b.csv")) {   
    $searchAddress = $u.X500
	Get-ADUser -ResultPageSize 2147483647 -LDAPFilter "(&(objectCategory=person)(objectClass=user)(|(proxyAddresses= *$searchAddress)))" | select-Object SID,SamAccountName,GivenName,Surname,Name,DisplayName,UserPrincipalName, @{L="X500Address"; E={$searchAddress}}
 }
$results | Export-Csv $FilePath -NoTypeInfo