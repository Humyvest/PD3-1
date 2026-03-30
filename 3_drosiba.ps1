$status = Get-MpComputerStatus

if ($status.RealTimeProtectionEnabled -eq $false -or $status.QuickScanAge -gt 3) {
    Write-Host "Sistema ir apdraudeta!" -ForegroundColor Red
} 
else {
    Write-Host "Sistema ir drosa." -ForegroundColor Green
}
