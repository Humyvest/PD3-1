$start = (Get-Date).AddDays(-7)


$errors = Get-WinEvent -FilterHashtable @{
    LogName = 'System'
    Level = 2
    StartTime = $start
}


$count = $errors.Count

$file = "$env:USERPROFILE\Documents\Errors.txt"

if ($count -gt 10) {
    "[KRITISKI] Sistēma ir nestabila!" | Out-File $file
} else {
    "[OK] Kļūdu līmenis normāls." | Out-File $file
}


$errors | ForEach-Object {
    "$($_.TimeCreated) - $($_.Message)"
} | Out-File $file -Append
