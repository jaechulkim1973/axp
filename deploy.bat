@echo off
chcp 65001 >nul
echo ========================================
echo  AXP Gold-Runner - GitHub + Vercel Deploy
echo ========================================
echo.

cd /d "%~dp0"

echo [1/6] Git 초기화...
git init
echo.

echo [2/6] 파일 추가...
git add -A
echo.

echo [3/6] 상태 확인...
git status
echo.

echo [4/6] 커밋...
git commit -m "feat: AXP Gold-Runner Premium Website v1.0"
echo.

echo [5/6] GitHub 원격 저장소 연결...
git remote remove origin 2>nul
git remote add origin https://github.com/jaechulkim1973/axp.git
echo.

echo [6/6] GitHub 푸시...
git branch -M main
git push -u origin main
echo.

echo ========================================
echo  완료! 다음 단계:
echo  1. https://vercel.com 로그인
echo  2. Add New Project - axp Import
echo  3. Framework: Other - Deploy
echo  4. Domains: axp.kr 추가 (선택사항)
echo ========================================
pause
