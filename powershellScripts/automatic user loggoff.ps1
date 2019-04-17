foreach ($user in quser | select ID, username, 'idle time' )   {

if($user.'IDLE TIME' -gt 10) {

    logoff /server:localhost  $user.ID
    $Output = "Logging off $user.username"}
}  

else {$Output = "No users to log off" }






$localServerName = Get-WmiObject -Class Win32_ComputerSystem | Select Name
$servername = $localServerName.Name
$Jallie =@()
foreach($users in Get-WmiObject win32_process -ComputerName $localServerName.Name | where {$_.ProcessName -eq 'explorer.exe'} )
{
     $temp = " " | select Processname,Username,SessionId
     $temp.Processname = $users.ProcessName
     $temp.Username = $users.GetOwner().user
     $temp.Sessionid = $users.SessionId
     $Jallie += $temp
}
$servername = $localServerName.Name
foreach($element in $Jallie)
{
      if($element.username -eq 'user1')
      {
            logoff $element.Sessionid /SERVER:$servername
            'Logging off ' + $element.username
      }
      elseif($element.username -eq 'user2')
      {
            logoff $element.Sessionid /SERVER:$servername
            'Logging off ' + $element.username
      }

}$localServerName = Get-WmiObject -Class Win32_ComputerSystem | Select Name
$servername = $localServerName.Name
$Jallie =@()
foreach($users in Get-WmiObject win32_process -ComputerName $localServerName.Name | where {$_.ProcessName -eq 'explorer.exe'} )
{
     $temp = " " | select Processname,Username,SessionId
     $temp.Processname = $users.ProcessName
     $temp.Username = $users.GetOwner().user
     $temp.Sessionid = $users.SessionId
     $Jallie += $temp
}
$servername = $localServerName.Name
foreach($element in $Jallie)
{
      if($element.username -eq 'user1')
      {
            logoff $element.Sessionid /SERVER:$servername
            'Logging off ' + $element.username
      }
      elseif($element.username -eq 'user2')
      {
            logoff $element.Sessionid /SERVER:$servername
            'Logging off ' + $element.username
      }

}


