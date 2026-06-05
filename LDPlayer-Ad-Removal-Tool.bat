:: =========================================================================================
:: Copyright (c) 2026 hyrsource. Licensed under the MIT License.
:: Original Repository: https://github.com/hyrsource/LDPlayer-Ad-Removal-Tool
:: =========================================================================================
@echo off
chcp 65001 >nul
cls
set "LD_DIR=C:\LDPlayer\LDPlayer9"
set "XUANZHI=%appdata%\XuanZhi9"
set "HTA_FILE=%temp%\ldgui.hta"

echo ^<html^>^<head^>^<title^>LDPlayer Ad Removal Tool^</title^> > "%HTA_FILE%"
echo ^<hta:application id="ldgui" border="thin" scroll="no" maximizebutton="no" minimizebutton="no" sysmenu="yes" /^> >> "%HTA_FILE%"
echo ^<style^> >> "%HTA_FILE%"
echo * { box-sizing: border-box; user-select: none; -ms-user-select: none; } >> "%HTA_FILE%"
echo body { background-color: #121212; color: #FFFFFF; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; padding: 25px; margin: 0; overflow: hidden; } >> "%HTA_FILE%"
echo h1 { color: #00FF66; font-size: 24px; margin: 0 0 12px 0; text-align: center; font-weight: bold; } >> "%HTA_FILE%"
echo p { color: #AAAAAA; font-size: 14px; margin: 0 0 25px 0; text-align: center; line-height: 1.4; } >> "%HTA_FILE%"
echo .btn-container { width: 100%; text-align: center; } >> "%HTA_FILE%"
echo .btn { background-color: #00FF66; color: #000000; border: none; width: 100%; padding: 18px 0; font-size: 17px; font-weight: bold; border-radius: 6px; cursor: pointer; transition: all 0.2s ease-in-out; display: block; text-transform: uppercase; letter-spacing: 0.5px; } >> "%HTA_FILE%"
echo .btn:hover { background-color: #00CC55; box-shadow: 0 0 15px rgba(0, 255, 102, 0.5); } >> "%HTA_FILE%"
echo ^</style^>^<script language="VBScript"^> >> "%HTA_FILE%"
echo Sub Window_OnLoad: width = 500: height = 260: window.resizeTo width, height: window.moveTo (screen.width - width) \ 2, (screen.height - height) \ 2: End Sub >> "%HTA_FILE%"
echo Sub RunAction: CreateObject("WScript.Shell").Run "cmd.exe /c echo GUI_CLICKED > %temp%\ldclick.txt", 0, True: window.close: End Sub >> "%HTA_FILE%"
echo ^</script^>^</head^>^<body^> >> "%HTA_FILE%"
echo ^<h1^>LDPlayer Ad Removal Tool^</h1^> >> "%HTA_FILE%"
echo ^<p^>Instantly eliminate all commercial advertisements from LDPlayer9.^</p^> >> "%HTA_FILE%"
echo ^<div class="btn-container"^>^<button class="btn" onclick="RunAction"^>Launch Ad-Block Removal^</button^>^</div^> >> "%HTA_FILE%"
echo ^</body^>^</html^> >> "%HTA_FILE%"

if exist "%temp%\ldclick.txt" del "%temp%\ldclick.txt" >nul 2>&1
mshta "%HTA_FILE%"

if not exist "%temp%\ldclick.txt" (
    del "%HTA_FILE%" >nul 2>&1
    exit
)

del "%HTA_FILE%" >nul 2>&1
del "%temp%\ldclick.txt" >nul 2>&1

echo =====================================================================
echo                       LDPlayer Ad Removal Tool
echo =====================================================================
echo.

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
echo  If this tool helped you, please leave a Star on GitHub! ⭐
echo  https://github.com/hyrsource/LDPlayer-Ad-Removal-Tool
echo =====================================================================
echo.
pause
