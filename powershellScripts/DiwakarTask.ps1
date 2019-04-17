while(1)
{
Write-Host -ForegroundColor Green "available options:"
Write-host -ForegroundColor Green "1.	Working with Windows Services"
Write-host -ForegroundColor Green   "2.	Working with Windows Event Log"
Write-host  -ForegroundColor Green "3.	Working with Windows Processes"
write-host  -ForegroundColor red  "4.	Exit "
$selected=Read-host "Choose a option"
Switch($selected)
{
1{ write-host "Working with window services"
   while($selected)
     {
   write-host "1.List all the Services with Running Status." 
   write-host "2.Fetch the list of Windows Services with specific Displayname (1 User Input : WildCard Text Search)"
   write-host "3.Fetch the list of Windows Services from the specific Name (1 User Input :Wild Card Text Search)"
   Write-Host "4.exit"
   
  $input=Read-host "enter a value:"
if($input -eq 1)
 {
   Get-Service | Where-Object {$_.status -eq "Running"}|ft -AutoSize
   }
if($input -eq 2)
   {
   $b=Read-host "enter a starting letters or word which u want to display:"
   Get-Service -Displayname "*$b*"|ft -AutoSize

    }
    if($input -eq 3)
      {
     $a=Read-Host "enter a complete service name:"
     Get-Service -DisplayName "*$a*"|ft -AutoSize
      }
    if($input -ge 4)
    {
    break
    }
    }
    }

   2{ write-host "Working with Event Log"
   while($selected)
     {
   write-host "1.List the latest 25 Error Events from specific Log container (1 User Input : Log Container)"
   Write-host "2.Get Events from Specific Log container from specific date to specific Date (3 User Inputs : Log Container Name, From Date, To Date)"
   write-host "3.Get the Events from Specific Event ID to Specific Event ID (2 User Input : Event ID Upper Limit and Event ID Lower Limit)"
   write-host "4.exit"


  $input=Read-host "enter a value:"
   if($input -eq 1)
 {

   $logcontainer=Read-host "enter logcontainer name"
  Get-EventLog -LogName System -EntryType Error -Newest 25
   }
if($input -eq 2)
   {
   $logcontainer=Read-Host "enter an event name"

   $startingdate=Read-host "enter starting date"
   $endingdate=Read-Host "enter ending date"
    $Begin = Get-Date -Date Read-host $startingdate 
    $End = Get-Date -Date $endingdate
   Get-EventLog -LogName $logcontainer  -After $Begin -Before $End


    }
    if($input -eq 3)
      {
   $logcontainer=Read-host "enter event name"
    $starteventid =Read-host "enter starting event id"
    $endeventid=Read-host "enter ending event id"

     Get-EventLog -LogName $logcontainer | where eventid -le $endeventid |where eventid -gt $starteventid | Sort-Object -Property eventid -Descending

      }
    if($input -ge 4)
    {
    break
    }
    }

}

3{ write-host "Working with window processes"
   while($selected)
     {
   write-host "1.List all the Windows processes with specific processname (1 User Input: Wildcard Text Search)"
   write-host "2.List all the Processes between the Lower Limit and Upper Limit of the Handles and sort Handles 
   in descending order (2 User Input : Lower Limit & Upper Limit of Handles)"
   write-host "3.Sort all the Windows Processes with Process ID in descending order"
   write-host "4.exit"

  $input=Read-host "enter a value:"
   if($input -eq 1)
 {

   $a=Read-host "enter specific process name u want to display"
   Get-Process winword,$a|ft -AutoSize *
   }
if($input -eq 2)
   {
   
    $i=Read-host "enter lowervalue"
    $j=Read-host "enter uppervalue"

     Get-Process | where Handles -le $j |where Handles -gt $i | Sort-Object -Property Handles -Descending



    }
    if($input -eq 3)
      {
    Get-Process | Sort-Object -Property Id
      }
    if($input -ge 4)
    {
    break
    }
    }

}
}


}
