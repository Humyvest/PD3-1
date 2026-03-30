$disk = Get-PSDrive C


$freePercent = ($disk.Free / ($disk.Used + $disk.Free)) * 100


$log = "$env:USERPROFILE\Documents\Apkope.log"


$time = Get-Date


if ($freePercent -lt 25) {


    $before = $disk.Free

   
    Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue

    
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue

   
    $after = (Get-PSDrive C).Free

    
    $freed = ($after - $before) / 1GB

    
    "[$time] Tirisana veikta. Atbrivoti $([math]::Round($freed,2)) GB." | Out-File $log -Append

} else {
    
    "[$time] Vieta pietiekama." | Out-File $log -Append
}
