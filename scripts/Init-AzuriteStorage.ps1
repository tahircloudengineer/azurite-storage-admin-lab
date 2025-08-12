param()
Write-Host "==> Initializing Azurite connection (PowerShell)"
$env:AZURE_STORAGE_CONNECTION_STRING = "UseDevelopmentStorage=true"
# Create a demo container (idempotent)
az storage container create --name demo --connection-string $env:AZURE_STORAGE_CONNECTION_STRING | Out-Null
Write-Host "✅ Container 'demo' ready."
