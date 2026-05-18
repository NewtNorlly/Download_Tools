$gitExe = "C:\Program Files\Git\bin\git.exe"
$sshExe = "C:\Program Files\Git\bin\ssh.exe"
$ErrorActionPreference = "Continue"

Set-Location "C:\Users\NewtN\Desktop\Download_Tools"

# Configure git
Write-Output ">>> Configuring git user..."
& $gitExe config user.name "NewtNorlly"
& $gitExe config user.email "newtnorlly@outlook.com"

# Set SSH env
$env:GIT_SSH_COMMAND = "`"$sshExe`" -i C:\Users\NewtN\.ssh\id_ed25519_github -o StrictHostKeyChecking=no"

Write-Output ">>> Checking remote..."
& $gitExe remote -v

Write-Output ">>> Staging files..."
& $gitExe add -A
Write-Output "Staging done. Exit code: $LASTEXITCODE"

Write-Output ">>> Committing..."
& $gitExe commit -m "Initial commit: Download_Tools"
Write-Output "Commit done. Exit code: $LASTEXITCODE"

Write-Output ">>> Pushing to origin main..."
& $gitExe push -u origin main 2>&1
Write-Output "Push done. Exit code: $LASTEXITCODE"

Write-Output ">>> FINISHED <<<"
