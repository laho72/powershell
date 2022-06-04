Get-Service | Where-Object {$_.Status -eq "Running"} |
  Where-Object {$_.DependentServices} |
    Format-List -Property Name, DependentServices, @{
      Label="NoOfDependentServices"; Expression={$_.dependentservices.count}
    }
    $input = Read-Host -Prompt 'Enter Dependent Service'
    Get-WmiObject win32_service -Filter "Name = '$input'"

