#Created by: Bryan Swainston
#Creation Date: 4-26-2018

#For a text file containing a list of IPs:
#$listofIPs = Get-Content #add path to list of IP's.txt


 
#Or you can list them here and uncomment it. Be sure to comment out the above line before executing. 
$listofIPs = "8.8.8.8"


 

#create a blank array for the resolved names

$ResultList = @()


 

# resolve each of these addresses

foreach ($ip in $listofIPs)

{

     $result = $null

    

     $currentEAP = $ErrorActionPreference

     $ErrorActionPreference = "silentlycontinue"

    

     #Use the DNS Static .Net class for the reverse lookup

     # details on this method found here: http://msdn.microsoft.com/en-us/library/ms143997.aspx

     $result = [System.Net.Dns]::gethostentry($ip)

    

     $ErrorActionPreference = $currentEAP

    

     If ($Result)

     {

          $Resultlist += [string] $IP + " - " + $Result.HostName +";"

     }

     Else

     {

          $Resultlist += "$IP - No HostNameFound"

     }

}

$Resultlist | Out-File C:\Users\bryan.swainston\Desktop\list.txt


 

$ResultList
