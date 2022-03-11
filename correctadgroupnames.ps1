$adgroupscsv = "C:\Documents\allfilepermissions.csv"
$adgroupcsvcontents = Get-Content -LiteralPath $adgroupscsv

$results = foreach ($group in $adgroupcsvcontents){
    $outputfilelocation = "C:\Documents\ADGroupscorrected.csv"
    get-adgroup -Filter "name -like '$group'" -Properties * -SearchBase "dc=corp,dc=x,dc=net" | select name
}
$results | Export-Csv $outputfilelocation -NoTypeInformation