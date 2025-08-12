param()
Write-Host "==> Creating sample file and uploading to Azurite"
$env:AZURE_STORAGE_CONNECTION_STRING = "DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://127.0.0.1:10000/devstoreaccount1;QueueEndpoint=http://127.0.0.1:10001/devstoreaccount1;TableEndpoint=http://127.0.0.1:10002/devstoreaccount1;"
New-Item -ItemType Directory artifacts -ErrorAction SilentlyContinue | Out-Null
"hello from azurite $(Get-Date -Format o)" | Out-File artifacts/hello.txt -Encoding utf8
az storage blob upload --container-name demo --name hello.txt --file artifacts/hello.txt --connection-string $env:AZURE_STORAGE_CONNECTION_STRING | Out-Null
Write-Host "âœ… Uploaded 'hello.txt' to container 'demo'."


