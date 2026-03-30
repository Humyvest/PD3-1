$apps = winget upgrade

# Noņem pirmās 2 rindas (header) un tukšās rindas
$list = $apps | Select-Object -Skip 2 | Where-Object { $_ -ne "" }

$count = $list.Count

Write-Host "Sistema ir $count programmas, kuras nepieciesams atjauninat."
