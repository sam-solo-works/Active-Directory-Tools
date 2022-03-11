$GroupMbrs = ForEach ($Group in ($Groups = Import-csv C:\utilz\Powershell\PullUserDetails\DG2Create_test.csv)) 
{ Get-ADGroupMember -Identity $Group.name |
    #Select-Object @{n='GroupName';e={$Group.name}}, if(Get-ADUser $_ | where-object {$_.Enabled = $True}){ Name, ObjectClass,
	Select-Object @{n='GroupName';e={$Group.name}}, Name, ObjectClass,
  				  @{n='X500 Address';e={
                  (Get-ADUser $_ -Properties * | Select-Object @{L = "ProxyAddresses"; E = {($_.ProxyAddresses | Where-Object { $_ -match "test"}) -join ";"}} )}},
				  @{n='Enabled';e={if ($_.ObjectClass -eq 'user') {
                    Get-ADUser $_ | Select-Object -Expand Enabled
                  } else {
                    'NA/Group'
                  }}}
				  }
                                   
    Write-Host $Group.name
$GroupMbrs | Sort GroupName,Name| Export-CSV "C:\utilz\Powershell\PullUserDetails\GroupsListwNamesPOC $(get-date -f dd-MMM_hh_mm_ss).csv" -NoTypeInformation

