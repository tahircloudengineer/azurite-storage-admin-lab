param()
Write-Host "==> Listing blobs from container 'demo'"
$env:AZURE_STORAGE_CONNECTION_STRING = "UseDevelopmentStorage=true"
$listing = az storage blob list --container-name demo --connection-string $env:AZURE_STORAGE_CONNECTION_STRING --output table
$listing | Tee-Object -FilePath artifacts/listing.txt
Write-Host "✅ Saved listing to artifacts/listing.txt"
