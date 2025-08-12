#!/usr/bin/env bash
set -e
export AZURE_STORAGE_CONNECTION_STRING="UseDevelopmentStorage=true"
mkdir -p artifacts
echo "hello from azurite $(date -Iseconds)" > artifacts/hello.txt
az storage blob upload --container-name demo --name hello.txt --file artifacts/hello.txt --connection-string "$AZURE_STORAGE_CONNECTION_STRING" >/dev/null
echo "✅ Uploaded 'hello.txt'."
