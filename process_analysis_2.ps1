$mode = Read-Host -prompt 'One process or all? O/A'  

if ($mode -eq 'O'){ 

$input = Read-Host -prompt 'Enter a valid Process ID (PID)'  

Get-WmiObject win32_process -Filter "processID = '$input'" | Select-Object -Property Name, ProcessID, parentProcessID, SessionID, CommandLine | Out-GridView 

}elseif($mode -eq 'A') { 

Get-WmiObject win32_process | Select-Object -Property Name, ProcessID, parentProcessID, InstallDate, Status, SessionID, CommandLine | Out-GridView 

}else { 

Write-Host " Please restart the script and provide the O (One Process) or A (All Processes) flag " 

} 

