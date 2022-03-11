$GroupMbrs = ForEach ($Group in ($Groups = Import-csv C:\Documents\adgroupscorrected.csv)) 
{ Get-ADGroupMember -Identity $Group.name |
#{ Get-ADGroupMember -Identity $Group |
    Select-Object @{n='GroupName';e={$Group.name}}, Name, ObjectClass,
    #Select-Object @{n='GroupName';e={$Group}}, Name, ObjectClass,
                  @{n='Enabled';e={if ($_.ObjectClass -eq 'user') {
                    Get-ADUser $_ | Select-Object -Expand Enabled
                  } else {
                    'NA/Group'
                  }}}
    Write-Host $Group.name
}
$GroupMbrs | Sort GroupName,Name| Export-CSV "C:\Documents\GroupsListwNamesPOC $(get-date -f dd-MMM_hh_mm_ss).csv" -NoTypeInformation