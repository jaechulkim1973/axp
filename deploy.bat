@echo off
chcp 65001 >nul
title AXP Gold-Runner Deployment Portal
echo ============================================================
echo      AXP | G-HVTOL Gold-Runner Deployment Portal
echo ============================================================
echo.
cd /d "%~dp0"

:: Check if git is initialized
if not exist .git (
    echo [!] Git repository not found. Initializing...
    git init
    git branch -M main
)

echo [1/5] Staging latest changes...
git add -A
echo.

echo [2/5] Verification: Checking project status...
git status -s
echo.

echo [3/5] Committing ultra-premium v4.0M updates...
git commit -m "deploy: v4.0M ultra-premium rebuild with glassmorphism and technical library"
echo.

echo [4/5] Synchronizing remote repository (jaechulkim1973/axp)...
:: Attempt to add origin if it doesn't exist, or set it if it does
git remote add origin https://github.com/jaechulkim1973/axp.git 2>nul
git remote set-url origin https://github.com/jaechulkim1973/axp.git
echo.

echo [5/5] Pushing to GitHub (main branch)...
echo.
git push -u origin main --force
echo.

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [X] ERROR: Push failed. Please check your internet connection or GitHub credentials.
    echo ============================================================
    pause
    exit /b %ERRORLEVEL%
)

echo ============================================================
echo  SUCCESS: GitHub Repository Synchronized!
echo ============================================================
echo.
echo  VERCEL DEPLOYMENT STATUS:
echo  1. Visit Dashboard: https://vercel.com/dashboard
echo  2. Project: jaechulkim1973/axp
echo  3. Domain: https://axp.kr (Verified)
echo.
echo  The site should be live within 30-60 seconds.
echo ============================================================
echo.
pause
