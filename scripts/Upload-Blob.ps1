param()
Write-Host "==> Creating sample file and uploading to Azurite"
$env:AZURE_STORAGE_CONNECTION_STRING = "UseDevelopmentStorage=true"
New-Item -ItemType Directory artifacts -ErrorAction SilentlyContinue | Out-Null
"hello from azurite $(Get-Date -Format o)" | Out-File artifacts/hello.txt -Encoding utf8
az storage blob upload --container-name demo --name hello.txt --file artifacts/hello.txt --connection-string $env:AZURE_STORAGE_CONNECTION_STRING | Out-Null
Write-Host "✅ Uploaded 'hello.txt' to container 'demo'."
