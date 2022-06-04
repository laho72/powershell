[int]$processId = Read-Host -prompt 'Please enter a valid Process ID (PID)' 
$printHdr = $true 
$modules = get-process -id $processId | select -expand Modules -ea silentlycontinue 
foreach ($module in $modules) { 
$actualBase = $module.BaseAddress.ToInt64() 
if ($actualBase -ne $imageBase) { 
if ($printHdr) { 
"`nModule Relocations in Process Id: $processId" 
"--------------------------------------------" 
$printHdr = $false 
} 
"{0}`n Loaded at: 0x{2:X8}" -f $module.Filename, $imageBase, $actualBase 
} 
} 

