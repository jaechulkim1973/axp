@echo off
chcp 65001 >nul
title AXP | Gold-Runner Master Deployment
setlocal enabledelayedexpansion

echo ============================================================
echo      AXP | G-HVTOL Gold-Runner Master Deployment
echo ============================================================
echo.
cd /d "%~dp0"

:: 1. Check Git Environment
echo [1/6] Checking Git Environment...
git --version >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [X] Error: Git is not installed or not in PATH.
    pause
    exit /b
)

if not exist .git (
    echo [!] Initializing new Git repository...
    git init
    git branch -M main
)
echo.

:: 2. Remote Configuration
echo [2/6] Configuring Remote (jaechulkim1973/axp)...
git remote remove origin >nul 2>&1
git remote add origin https://github.com/jaechulkim1973/axp.git
echo Remote set to: https://github.com/jaechulkim1973/axp.git
echo.

:: 3. Staging & Commit
echo [3/6] Staging all assets (HTML, CSS, JS, Images)...
git add -A
echo.
echo [4/6] Creating deployment commit...
set "commit_msg=deploy: v4.1M Visual Upgrade - High-res Aircraft Images & Master Gallery"
git commit -m "%commit_msg%"
echo.

:: 4. Push to GitHub
echo [5/6] Synchronizing with GitHub...
echo (You may be prompted for credentials if not logged in)
echo.
git push -u origin main --force

if %ERRORLEVEL% neq 0 (
    echo.
    echo [X] PUSH FAILED: Possible authentication issue or network error.
    echo Please ensure you are logged into GitHub Desktop or have a Personal Access Token set up.
    echo ============================================================
    pause
    exit /b
)
echo.

:: 5. Success & Next Steps
echo ============================================================
echo  SUCCESS: Your project is now on GitHub!
echo ============================================================
echo.
echo  LIVE DEPLOYMENT (Vercel):
echo  1. The build will trigger automatically on Vercel.
echo  2. Live URL: https://axp.kr
echo  3. Vercel Console: https://vercel.com/dashboard
echo.
echo  Opening Live Site in 5 seconds...
timeout /t 5 >nul
start https://axp.kr

echo.
echo Press any key to exit.
pause >nul
