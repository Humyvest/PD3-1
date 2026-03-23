$topProcesses = Get-Process |
        Where-Object { $_.ProcessName -ne 'svchost' } |
        Sort-Object -Property WorkingSet -Descending |
        Select-Object -First 5 `
            @{Name='ProcessName'; Expression={$_.ProcessName}},
            @{Name='ID'; Expression={$_.Id}},
            @{Name='RAM_MB'; Expression={[math]::Round($_.WorkingSet / 1MB, 2)}}
    if ($topProcesses) {
        Write-Host "Top 5 RAM-consuming processes (excluding 'svchost'):" -ForegroundColor Cyan
        $topProcesses | Format-Table -AutoSize
    }
    else {
        Write-Host "No processes found matching the criteria." -ForegroundColor Yellow
    }
catch {
    Write-Host "Error retrieving process information: $($_.Exception.Message)" -ForegroundColor Red
}
