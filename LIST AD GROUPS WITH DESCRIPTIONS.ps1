<#
    This script pulls all ADgroups from the users current domain controller and puts the groups name, description, category, and scope into a csv for easy parsing of data.
    Author: Sam Solmonson
#>
$exportList = @() #Create exportList array to add data to from ADGroups to be added to the CSV


$ADgroups = Get-ADGroup -Filter * -Properties Description #Function to pull ADgroups


Foreach ($group in $adgroups){
$GroupObj = New-Object System.Object #Create object to attach ADgroup Values to and add to array that will be exported to CSV.
$GroupObj | Add-Member -Type NoteProperty -Name Name -Value $group.Name #Add group Name to new object
$GroupObj | Add-Member -Type NoteProperty -Name Description -Value $group.Description #Add group description to new object
$GroupObj | Add-Member -Type NoteProperty -Name Category -Value $group.GroupCategory #Add group category to new object
$GroupObj | Add-Member -Type NoteProperty -Name Scope -Value $group.GroupScope #Add group scope to new object

$exportList += $GroupObj #Add Object to Array before looping back to the top to make another new object.
} #When loop is finished export as a CSV.
$exportList | export-csv C:\test\ADGroups.csv
