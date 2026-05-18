@echo off
cd /d C:\Users\NewtN\Desktop\Download_Tools
set GITEXE=C:\Program Files\Git\bin\git.exe
set SSHEXE=C:\Program Files\Git\bin\ssh.exe

REM Configure git user (required for commit)
"%GITEXE%" config user.name "NewtNorlly"
"%GITEXE%" config user.email "newtnorlly@outlook.com"

REM Set SSH command with host key auto-accept and explicit key
set GIT_SSH_COMMAND="%SSHEXE%" -i C:\Users\NewtN\.ssh\id_ed25519_github -o StrictHostKeyChecking=no

echo ===== Stage all files =====
"%GITEXE%" add -A

echo ===== Commit =====
"%GITEXE%" commit -m "Initial commit: Download_Tools"

echo ===== Push to GitHub =====
"%GITEXE%" push -u origin main

echo ===== DONE =====
