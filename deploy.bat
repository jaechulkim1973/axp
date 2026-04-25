@echo off
chcp 65001 >nul
echo ========================================
echo  AXP Gold-Runner - GitHub Deploy
echo ========================================
echo.
cd /d "%~dp0"
echo [1/5] Git add...
git add -A
echo.
echo [2/5] Git status...
git status
echo.
echo [3/5] Git commit...
git commit -m "feat: Add aerial-charging page and fix images"
echo.
echo [4/5] Set remote...
git remote set-url origin https://github.com/jaechulkim1973/axp.git
echo.
echo [5/5] Git push...
git push -u origin main --force
echo.
echo ========================================
echo  Deploy complete!
echo  Site: https://www.axp.kr
echo ========================================
pause
