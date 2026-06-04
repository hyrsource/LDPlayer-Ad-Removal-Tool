@echo off
cls

echo =====================================================================
echo                       LDPlayer Ad Removal Tool
echo =====================================================================
echo.

set "LD_DIR=C:\LDPlayer\LDPlayer9"
set "XUANZHI=%appdata%\XuanZhi9"



echo [DEBUG] Terminating active processes to apply file hardening...
taskkill /f /im dnplayer.exe >nul 2>&1
taskkill /f /im ldnews.exe >nul 2>&1
taskkill /f /im ldbox.exe >nul 2>&1

echo [DEBUG] Cleaning Windows installation skin folders...
icacls "res" /grant everyone:F /t >nul 2>&1
icacls "skin" /grant everyone:F /t >nul 2>&1

rd /s /q "res\ad" >nul 2>&1
rd /s /q "skin\ad" >nul 2>&1
del /f /q "res\splash*.jpg" >nul 2>&1
del /f /q "res\splash*.png" >nul 2>&1

mkdir "res\ad" >nul 2>&1
mkdir "skin\ad" >nul 2>&1
echo. > "res\splash.jpg"
echo. > "res\splash.png"

echo [DEBUG] Locking Windows installation skin folders...
icacls "res\ad" /inheritance:d >nul 2>&1
icacls "res\ad" /deny everyone:(OI)(CI)(W) >nul 2>&1
icacls "skin\ad" /inheritance:d >nul 2>&1
icacls "skin\ad" /deny everyone:(OI)(CI)(W) >nul 2>&1
icacls "res\splash.jpg" /inheritance:d >nul 2>&1
icacls "res\splash.jpg" /deny everyone:(W) >nul 2>&1
icacls "res\splash.png" /inheritance:d >nul 2>&1
icacls "res\splash.png" /deny everyone:(W) >nul 2>&1

cd /d "%XUANZHI%" >nul 2>&1

echo [DEBUG] Securing AppData directory folders...
icacls "cache" /grant everyone:F /t >nul 2>&1
icacls "vms\recommend" /grant everyone:F /t >nul 2>&1
icacls "ldadconfig.data" /grant everyone:F /t >nul 2>&1
attrib -R "ldadconfig.data" >nul 2>&1

rd /s /q "cache" >nul 2>&1
rd /s /q "vms\recommend" >nul 2>&1
del /f /q "ldadconfig.data" >nul 2>&1

mkdir "cache" >nul 2>&1
mkdir "vms\recommend" >nul 2>&1
echo. > "ldadconfig.data"

icacls "cache" /inheritance:d >nul 2>&1
icacls "cache" /remove everyone >nul 2>&1
icacls "cache" /deny everyone:(OI)(CI)(F) >nul 2>&1

icacls "vms\recommend" /inheritance:d >nul 2>&1
icacls "vms\recommend" /remove everyone >nul 2>&1
icacls "vms\recommend" /deny everyone:(OI)(CI)(F) >nul 2>&1

icacls "ldadconfig.data" /inheritance:d >nul 2>&1
icacls "ldadconfig.data" /remove everyone >nul 2>&1
icacls "ldadconfig.data" /deny everyone:(F) >nul 2>&1
attrib +R "ldadconfig.data" >nul 2>&1

echo.
color 0A
echo =====================================================================
echo  Operation Complete, Enjoy your free ad experience on LDPlayer!
echo =====================================================================
echo.
pause
