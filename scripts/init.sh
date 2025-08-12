#!/usr/bin/env bash
set -e
export AZURE_STORAGE_CONNECTION_STRING="UseDevelopmentStorage=true"
az storage container create --name demo --connection-string "$AZURE_STORAGE_CONNECTION_STRING" >/dev/null
echo "✅ Container 'demo' ready."
