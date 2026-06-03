@echo off
chcp 65001 >nul
cls

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] Error: Please run this script as ADMINISTRATOR.
    pause
    exit /b
)

echo [DEBUG] Terminating LDPlayer processes...
taskkill /f /im dnplayer.exe >nul 2>&1
taskkill /f /im ldnews.exe >nul 2>&1
taskkill /f /im ldbox.exe >nul 2>&1

echo [DEBUG] Blocking ad domains in Windows hosts file...
set "HOSTS_FILE=%systemroot%\System32\drivers\etc\hosts"
attrib -R "%HOSTS_FILE%" >nul 2>&1

findstr /I "cdn.ldplayer.net" "%HOSTS_FILE%" >nul 2>&1
if %errorLevel% neq 0 echo 0.0.0.0 cdn.ldplayer.net>>"%HOSTS_FILE%"

findstr /I "://ldrescdn.com" "%HOSTS_FILE%" >nul 2>&1
if %errorLevel% neq 0 echo 0.0.0.0 ://ldrescdn.com>>"%HOSTS_FILE%"

ipconfig /flushdns >nul 2>&1

set "XUANZHI_DIR=%appdata%\XuanZhi9"
echo [DEBUG] Target directory: %XUANZHI_DIR%

if not exist "%XUANZHI_DIR%" (
    echo [DEBUG] ERROR: XuanZhi9 folder not found.
    pause
    exit /b
)
cd /d "%XUANZHI_DIR%"

echo [DEBUG] Unlocking permissions for old files...
icacls "cache" /grant everyone:F /t >nul 2>&1
icacls "ldadconfig.data" /grant everyone:F >nul 2>&1
attrib -R "ldadconfig.data" >nul 2>&1

echo [DEBUG] Deleting cache and ad configuration files...
rd /s /q "cache" >nul 2>&1
del /f /q "ldadconfig.data" >nul 2>&1

echo [DEBUG] Creating new dummy items...
mkdir "cache" >nul 2>&1
echo. > "ldadconfig.data"

echo [DEBUG] Applying security restrictions (Write Block)...
icacls "cache" /inheritance:d >nul 2>&1
icacls "cache" /remove everyone >nul 2>&1
icacls "cache" /deny everyone:(OI)(CI)(F) >nul 2>&1

icacls "ldadconfig.data" /inheritance:d >nul 2>&1
icacls "ldadconfig.data" /remove everyone >nul 2>&1
icacls "ldadconfig.data" /deny everyone:(F) >nul 2>&1
attrib +R "ldadconfig.data" >nul 2>&1

echo [DEBUG] Verifying block status...
set "SUCCESS=1"
echo test > "cache\test.txt" >nul 2>&1
if exist "cache\test.txt" set "SUCCESS=0"

echo.
if "%SUCCESS%"=="1" (
    color 0A
    echo =====================================================================
    echo  [✓] Operation Complete, Enjoy your free ads experience on LDPlayer!
    echo =====================================================================
) else (
    color 0C
    echo =====================================================================
    echo  [X] Error: Cache folder restriction failed.
    echo =====================================================================
)
echo.
pause
