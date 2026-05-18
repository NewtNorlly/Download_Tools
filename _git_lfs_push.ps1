$gitExe = "C:\Program Files\Git\bin\git.exe"
$sshExe = "C:\Program Files\Git\bin\ssh.exe"
$ErrorActionPreference = "Continue"
Set-Location "C:\Users\NewtN\Desktop\Download_Tools"

# Configure SSH for Git
$env:GIT_SSH_COMMAND = "`"$sshExe`" -i C:\Users\NewtN\.ssh\id_ed25519_github -o StrictHostKeyChecking=no"

# Configure git user
Write-Output ">>> Configuring git user..."
& $gitExe config user.name "NewtNorlly"
& $gitExe config user.email "newtnorlly@outlook.com"

# Ensure remote is set
$remote = & $gitExe remote get-url origin 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Output ">>> Adding remote origin..."
    & $gitExe remote add origin git@github.com:NewtNorlly/Download_Tools.git
} else {
    Write-Output ">>> Remote origin already set: $remote"
}

# Clean staging area (reset any previous partial adds)
Write-Output ">>> Resetting staging area..."
& $gitExe rm --cached -r . 2>&1 | Out-Null
& $gitExe reset HEAD . 2>&1 | Out-Null

# Initialize Git LFS
Write-Output ">>> Initializing Git LFS..."
& $gitExe lfs install

# Track large files
Write-Output ">>> Tracking binary files with LFS..."
& $gitExe lfs track "*.zip"
& $gitExe lfs track "*.exe"
& $gitExe lfs track "*.7z"
& $gitExe lfs track "*.rar"
& $gitExe lfs track "*.msi"
& $gitExe lfs track "*.dmg"

Write-Output ">>> .gitattributes:"
Get-Content .gitattributes

# Commit .gitattributes first
Write-Output ">>> Committing .gitattributes..."
& $gitExe add .gitattributes
& $gitExe commit -m "Configure Git LFS for binary files"
Write-Output "Exit: $LASTEXITCODE"

# Stage everything
Write-Output ">>> Staging all files (LFS will intercept large files)..."
& $gitExe add -A
Write-Output "Staging done: $LASTEXITCODE"

# Commit
Write-Output ">>> Committing..."
& $gitExe commit -m "Initial commit: Download_Tools"
Write-Output "Commit done: $LASTEXITCODE"

# Push
Write-Output ">>> Pushing to origin main..."
& $gitExe push -u origin main 2>&1
Write-Output "Push done: $LASTEXITCODE"

Write-Output ">>> ALL DONE <<<"
