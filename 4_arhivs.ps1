
$file = "$env:USERPROFILE\Documents\Errors.txt"


$date = Get-Date -Format "yyyy-MM-dd"


$zip = "$env:USERPROFILE\Documents\Atskaite_$date.zip"


Compress-Archive -Path $file -DestinationPath $zip -Force


$size = (Get-Item $zip).Length / 1KB


Write-Host "Izmers: $([math]::Round($size,2)) KB"
