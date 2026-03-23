$CompObject = Get-WmiObject -Class Win32_OperatingSystem
$TotalRAM = [math]::Round($CompObject.TotalVisibleMemorySize / 1MB, 2)
$FreeRAM = [math]::Round($CompObject.FreePhysicalMemory / 1MB, 2)
$UsedRAM = [math]::Round($TotalRAM - $FreeRAM, 2)
# Percentage used
$PercentUsed = [math]::Round((($UsedRAM / $TotalRAM) * 100), 2)
Write-Host "Total RAM: $TotalRAM MB"
Write-Host "Used RAM: $UsedRAM MB"
Write-Host "Free RAM: $FreeRAM MB"
Write-Host "Memory Usage: $PercentUsed %"
