#!/usr/bin/env bash
set -e
export AZURE_STORAGE_CONNECTION_STRING="UseDevelopmentStorage=true"
az storage blob list --container-name demo --connection-string "$AZURE_STORAGE_CONNECTION_STRING" --output table | tee artifacts/listing.txt
echo "✅ Listing saved to artifacts/listing.txt"
