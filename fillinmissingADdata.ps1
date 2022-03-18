###THIS WILL AMMEND AD MISSING INFORMATION FOR THE USERNAME IN CSV FILE!###

param (
	
#    [Parameter( Mandatory=$false)]
    [string]$CSVFileName="D:\verified\usernames.csv"
    [string]$CSVFileName2= #this is where you would put the information you wanted to update.

)


If (Test-Path $CSVFileName) {

    #Import the CSV file
    $csvfile = Import-CSV $CSVFileName
        
    #Loop through CSV file
    foreach ($user in $csvfile) {

        try {
        #Find the ad user
        $Users = Get-ADUser -SamAccountName $user.Username -OfficePhone $user.Telephone | Where -Property -eq "missing"
            foreach ($user in $Users) {
            Get-Content $CSVFileName2
            set-aduser-SamAccountName $user.Username -OfficePhone $user.Telephone #might need to set a different variable here to get it to work correctly im not sure.
            "$($user.username) Telephone number was updated."
            }
            }

       catch {
            
            $message = "A problem occured trying to create the $($user.username) O365 Mailbox"
            Write-Warning $message
        }
    }
}
else {

    $message = "The CSV file $CSVFileName was not found."
    throw $message

}