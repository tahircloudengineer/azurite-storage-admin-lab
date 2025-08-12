param()
Write-Host "==> Cleaning up demo container and files"
$env:AZURE_STORAGE_CONNECTION_STRING = "UseDevelopmentStorage=true"
az storage container delete --name demo --connection-string $env:AZURE_STORAGE_CONNECTION_STRING --yes | Out-Null
Remove-Item -Force -ErrorAction SilentlyContinue artifacts/hello.txt
Write-Host "✅ Cleanup complete."
