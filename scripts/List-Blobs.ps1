param()
Write-Host "==> Listing blobs from container 'demo'"
$env:AZURE_STORAGE_CONNECTION_STRING = "DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://127.0.0.1:10000/devstoreaccount1;QueueEndpoint=http://127.0.0.1:10001/devstoreaccount1;TableEndpoint=http://127.0.0.1:10002/devstoreaccount1;"
$listing = az storage blob list --container-name demo --connection-string $env:AZURE_STORAGE_CONNECTION_STRING --output table
$listing | Tee-Object -FilePath artifacts/listing.txt
Write-Host "âœ… Saved listing to artifacts/listing.txt"


