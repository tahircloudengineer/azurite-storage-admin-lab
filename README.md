Azurite Storage Admin Lab (Local Azure Storage Emulator)

Objective
Demonstrate core Azure Storage administration skills without using a paid Azure subscription, by running the Azurite emulator locally. The lab involves creating a container, uploading a blob, listing its contents, and capturing proof of the process.

This uses the same Azure CLI commands as in the real Azure service but points them to the local Azurite emulator through UseDevelopmentStorage=true.

Prerequisites
Docker (recommended) or Node.js (npm i -g azurite)

Azure CLI
PowerShell 7+ (Windows/macOS/Linux) or Bash

Quick Start
1. Start Azurite
Option A – Docker (fastest)

docker run --name azurite -p 10000:10000 -p 10001:10001 -p 10002:10002 mcr.microsoft.com/azure-storage/azurite
Option B – npm (Node.js)

npm install -g azurite
azurite --location . --silent --blobPort 10000 --queuePort 10001 --tablePort 10002
(Personally, I prefer Docker here — fewer moving parts and no extra Node.js dependencies.)

2. Run the Lab (PowerShell)
pwsh -File scripts/Init-AzuriteStorage.ps1
pwsh -File scripts/Upload-Blob.ps1
pwsh -File scripts/List-Blobs.ps1
This will:

Create a local container named demo

Upload artifacts/hello.txt

Save a blob listing to artifacts/listing.txt

Bash alternative:
bash scripts/init.sh
bash scripts/upload.sh
bash scripts/list.sh
3. Evidence for the Lab
Make sure to capture:

Azurite running in your terminal (or Docker logs)

The CLI table output after listing blobs

Example CLI check:
az storage blob list --container-name demo --connection-string UseDevelopmentStorage=true --output table
You should see hello.txt listed. (In my case, I ran this twice because I forgot the --output table the first time — a good reminder to double-check your command flags.)

Repository Contents
scripts/Init-AzuriteStorage.ps1 – sets the connection string and creates the container

scripts/Upload-Blob.ps1 – creates a sample file and uploads it

scripts/List-Blobs.ps1 – lists blobs and saves output to a text file

scripts/Cleanup.ps1 – removes the container and temp files

scripts/*.sh – Bash equivalents

artifacts/ – screenshots and proof files

Portfolio Notes
What I did: Ran Azure Storage commands against Azurite, created containers and blobs, verified with CLI output.

Why this matters: Proves hands-on Azure Storage skills without cloud costs.

Results
Blob Listing Output:
Name       Blob Type    Blob Tier    Length    Content Type    Last Modified              Snapshot
---------  -----------  -----------  --------  --------------  -------------------------  ----------
hello.txt  BlockBlob    Hot          57        text/plain      2025-08-12T06:13:55+00:00
Screenshot Evidence:
<img width="677" height="172" alt="Screenshot 2025-08-12 115504" src="https://github.com/user-attachments/assets/f635efd4-58ae-4df7-be01-db668369c113" />

In a Real Azure Environment, I Would:
Enable soft delete & versioning

Apply lifecycle management rules

Store encryption keys in Azure Key Vault

Configure RBAC with least privilege

(This lab was straightforward but a nice refresher on blob storage basics — and yes, running it locally saved me from accidentally leaving a container running in the cloud and racking up costs!)

