Azurite Storage Admin Lab (Local Azure Storage Emulator)
Objective:
Demonstrate core Azure Storage administration skills without using a paid Azure subscription, by running the Azurite emulator locally. The lab involves creating a container, uploading a blob, listing its contents, and capturing proof of the process.

This setup uses the same Azure CLI commands as the real Azure service but points them to the local Azurite emulator through UseDevelopmentStorage=true.

Prerequisites
Docker (recommended) or Node.js (with npm i -g azurite)

Azure CLI

PowerShell 7+ (Windows/macOS/Linux) or Bash

Quick Start
1. Start Azurite
Option A – Docker (fastest)

bash
Copy
Edit
docker run --name azurite -p 10000:10000 -p 10001:10001 -p 10002:10002 mcr.microsoft.com/azure-storage/azurite
Option B – npm (Node.js)

bash
Copy
Edit
npm install -g azurite
azurite --location . --silent --blobPort 10000 --queuePort 10001 --tablePort 10002
2. Run the Lab (PowerShell)
powershell
Copy
Edit
pwsh -File scripts/Init-AzuriteStorage.ps1
pwsh -File scripts/Upload-Blob.ps1
pwsh -File scripts/List-Blobs.ps1
What this does:

Creates a local container named demo

Uploads a file artifacts/hello.txt

Saves a blob listing to artifacts/listing.txt

Bash Alternative
bash
Copy
Edit
bash scripts/init.sh
bash scripts/upload.sh
bash scripts/list.sh
3. Evidence for the Lab
You should capture:

Azurite running in your terminal (or Docker logs)

Output of the blob listing command

Example CLI check:

bash
Copy
Edit
az storage blob list --container-name demo --connection-string UseDevelopmentStorage=true --output table
You should see hello.txt listed.

Repository Contents
scripts/Init-AzuriteStorage.ps1 – sets the connection string and creates the container

scripts/Upload-Blob.ps1 – creates a sample file and uploads it to Azurite

scripts/List-Blobs.ps1 – lists blobs and saves the output to a text file

scripts/Cleanup.ps1 – removes the container and temp files

scripts/*.sh – Bash equivalents for each PowerShell script

artifacts/ – folder for screenshots and generated files

Portfolio Notes
What I did: Ran Azure Storage commands against Azurite, created containers and blobs, verified with CLI output.

Why this matters: Shows practical Azure Storage admin workflow without incurring cloud costs.

What I’d do in production: Enable soft delete and versioning, set lifecycle management rules, store encryption keys in Azure Key Vault, and configure RBAC with least privilege.
