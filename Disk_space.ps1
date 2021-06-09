$ServerList = Get-Content -Path C:\Users\Blackhammer24\Desktop\Serverlist.txt
Foreach($server in $ServerList)
{
    Write-host -f Cyan "Getting details of $server"
    Test-Connection -ComputerName $Server
    Get-WmiObject -Class win32_logicaldisk -ComputerName $server |Select PSComputerName ,@{'Name'='DeviceName';'Expression'={$_.DeviceID}}, @{'Name'='FreeSpace (%)';'Expression'={[math]::round(($_.FreeSpace/$_.size)*100)}}, @{'Name'='FreeSpace (GB)';'Expression'={[math]::Round($_.FreeSpace/1gb)}}

}