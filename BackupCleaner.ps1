$backupCleanerInstall = 'C:\scripts\BackupCleaner\'
$backupCleanerScript = $backupCleanerInstall+"BackupCleaner.ps1"
$backupCleanerLog = $backupCleanerInstall+"backupCleaner.log"

$emptyDirectoryPath = '.\empty'
$backupsPath = '.\BackupPath'

$oldBackups = Get-ChildItem -Path $backupsPath -Directory | Where-Object { $_.CreationTime -lt (Get-Date).AddDays(-7) }

foreach ($backup in $oldBackups) {
    Write-Host $backup
    $fullBackuPath = Join-Path -Path $backupsPath -ChildPath $backup
    robocopy $emptyDirectoryPath $fullBackuPath /purge
    Remove-Item $fullBackuPath
    Write-Host "Backup removed: " $backup | Out-File $backupCleanerLog
}