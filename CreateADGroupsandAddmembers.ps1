$Input = Import-CSV "C:\temp\test\4b.csv" 
[string]$OUPath = "OU=test,OU=Groups,DC=test,DC=local"



ForEach ($User in $Input){
    $group = $User.'test GroupName'
    $user = $User.UserName  
    $path = $User.Path.Replace("\\test\d$","\\test.test.test\test\F Drive\Network Share\Share")
    Write-Host "Creating $group"
    #Set-ADGroup -Identity $group -Description "Grants access to $path"
    New-ADGroup -Name $group -GroupCategory Security -GroupScope Universal -Path $OUPath -Description "Grants access to $path"
    Write-Host "$group created successfully!"
}

foreach ($User in $Input){
    $group = $User.'GroupName'
    $user = $User.UserName
    Write-Host "Adding $user to $group"
    Add-ADGroupMember -Identity $group -Members $user
    Write-Host "$user added to $group successfully!"
}