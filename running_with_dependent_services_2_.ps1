Get-Service -CN . | Where-Object { $_.status -eq ‘running’} |
ForEach-Object {
write-host “Service name $($_.name)”
  if($_.DependentServices)
    { write-host “`Services that depend on $($_.name)”
      foreach($s in $_.DependentServices)
       { “`t`t” + $s.name }
    } #end if DependentServices
  if($_.RequiredServices)
    { Write-host “`tServices required by $($_.name)”
      foreach($r in $_.RequiredServices)
       { “`t`t” + $r.name }
    } #end if DependentServices
} #end foreach-object
