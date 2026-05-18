@echo off
cd /d C:\Users\NewtN\Desktop\Download_Tools
set PATH=C:\Program Files\Git\usr\bin;C:\Program Files\Git\bin;C:\Program Files\Git\cmd;%PATH%
set "GIT_SSH_COMMAND=ssh -i C:/Users/NewtN/.ssh/id_ed25519_github -o StrictHostKeyChecking=no"
set GITEXE=C:\Program Files\Git\bin\git.exe

echo ===== Stage all changes =====
"%GITEXE%" add -A

echo ===== Commit cleanup =====
"%GITEXE%" commit -m "Clean up temp helper scripts"

echo ===== Push =====
"%GITEXE%" push origin main

echo ===== Delete temp files =====
del /q _*.bat _*.ps1 _*.sh cleanup.bat 2>nul

echo ===== DONE =====
