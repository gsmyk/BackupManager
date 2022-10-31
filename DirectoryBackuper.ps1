$backuperInstall = 'C:\scripts\Backuper\'
$backuperScript = $backuperInstall+"OneDriveBackuper.ps1"
$backuperLog = $backuperInstall+"backuper_log.log"

$sourcePath = 'Source-path'
$destinationPath = 'Destination-Path'

$today = Get-Date -UFormat "%Y-%m-%d"
$currentBackup = 'GDDKiA CPW-'+$today

$statTime = Get-Date -UFormat "%Y-%m-%d-%Hh%Mm%Ss"

Write-Host "Start at: " $statTime
Write-Host "From: " $sourcePath
Write-Host "To: " $currentBackup

"Backuper" | Out-File $backuperLog -append
$statTime | Out-File $backuperLog -append
$currentBackup | Out-File $backuperLog -append

robocopy $sourcePath (Join-Path -Path $destinationPath -ChildPath $currentBackup) /e # | Out-File $backuperLog -append

$finishTime = Get-Date -UFormat "%Y-%m-%d-%Hh%Mm%Ss"

$finishTime | Out-File $backuperLog -append
Write-Host "Finished at: " $finishTime
"Backup is complete" | Out-File $backuperLog -append