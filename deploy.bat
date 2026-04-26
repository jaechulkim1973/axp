@echo off
:: Set character set to UTF-8
chcp 65001 >nul
title AXP Gold-Runner Robust Deployer
setlocal

echo ============================================================
echo      AXP Gold-Runner - Robust Deployment System
echo ============================================================
echo.

:: Path check
cd /d "%~dp0"
echo Current Path: %CD%
echo.

:: Check Git availability
where git >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Git is not installed or not found in System PATH.
    echo Please install Git from https://git-scm.com/
    pause
    exit /b
)

:: 1. Force Clean Git State
echo [1/4] Preparing Git Environment...
if not exist .git (
    echo Initializing new repository...
    git init
    git branch -M main
)

:: 2. Remote Setup
echo [2/4] Setting Remote URL...
git remote remove origin >nul 2>&1
git remote add origin https://github.com/jaechulkim1973/axp.git
echo Remote: https://github.com/jaechulkim1973/axp.git
echo.

:: 3. Commit Changes
echo [3/4] Staging and Committing...
git add .
git commit -m "deploy: v4.1M ultimate visual upgrade"
echo.

:: 4. Push with Detail
echo [4/4] Pushing to GitHub...
echo If this hangs, check for a popup login window!
echo.
git push -u origin main --force

if %ERRORLEVEL% neq 0 (
    echo.
    echo [!] PUSH FAILED. 
    echo.
    echo Possible reasons:
    echo 1. You are not logged in to GitHub.
    echo    (Try running: git config --global user.email "your-email@example.com")
    echo 2. The repository name 'axp' might be different on GitHub.
    echo 3. Network or Firewall blocking the connection.
    echo.
    echo TRY THIS MANUALLY in your terminal:
    echo git push -u origin main --force
    echo.
) else (
    echo.
    echo ============================================================
    echo  SUCCESS! Project is now on GitHub.
    echo  Live at: https://axp.kr
    echo ============================================================
    timeout /t 3 >nul
    start https://axp.kr
)

pause
