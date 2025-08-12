# Azurite Storage Admin Lab (Local Azure Storage Emulator)

**Goal:** Demonstrate core Azure Storage admin skills **without a paid Azure subscription** using the **Azurite** emulator.
You will create a container, upload a blob, list contents, and capture proof for your portfolio.

> Works on **Windows/macOS/Linux**. Uses the same Azure CLI commands but points to the local emulator via `UseDevelopmentStorage=true`.

---

## 🧰 Prerequisites
- **Docker** (recommended) *or* **Node.js** (`npm i -g azurite`)
- **Azure CLI**
- **PowerShell 7+** (Windows/macOS/Linux) or **Bash**

---

## 🚀 Quick Start

### 1) Start Azurite
**Option A — Docker (fastest)**
```bash
docker run --name azurite -p 10000:10000 -p 10001:10001 -p 10002:10002 mcr.microsoft.com/azure-storage/azurite
```

**Option B — npm (Node.js)**
```bash
npm install -g azurite
azurite --location . --silent --blobPort 10000 --queuePort 10001 --tablePort 10002
```

### 2) Run the lab (PowerShell)
```powershell
pwsh -File scripts/Init-AzuriteStorage.ps1
pwsh -File scripts/Upload-Blob.ps1
pwsh -File scripts/List-Blobs.ps1
```
This will:
- Create a local container `demo`
- Upload `artifacts/hello.txt`
- Save a listing to `artifacts/listing.txt` (for screenshots)
- Echo success messages

**Bash (alternative)**
```bash
bash scripts/init.sh
bash scripts/upload.sh
bash scripts/list.sh
```

### 3) Evidence for your README
Add screenshots to `artifacts/`:
- Azurite logs running (Docker or terminal)
- The CLI table output after `List-Blobs.ps1` (and/or Storage Explorer view)

Commit and push the updated README with images.

---

## 📦 What this repo contains
- `scripts/Init-AzuriteStorage.ps1` — sets connection string and prepares a container
- `scripts/Upload-Blob.ps1` — creates a sample file and uploads it
- `scripts/List-Blobs.ps1` — lists blobs, writes table output to `artifacts/listing.txt`
- `scripts/Cleanup.ps1` — deletes the sample container and temp files
- `scripts/*.sh` — Bash equivalents
- `artifacts/` — put screenshots and generated proof files here

---

## 🧪 Verify
```powershell
az storage blob list --container-name demo --connection-string UseDevelopmentStorage=true --output table
```
You should see `hello.txt` listed.

---

## 📝 Portfolio Notes (copy into your main profile)
- **What I did:** Emulated Azure Storage locally, created containers/blobs via Azure CLI.
- **Why it matters:** Same admin workflow as real Azure, zero cost; proves CLI skills and storage concepts.
- **What I’d improve in real Azure:** Enable soft delete & versioning, lifecycle rules, encryption keys in Key Vault, RBAC with least privilege.
