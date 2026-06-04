# LDPlayer Ad-Removal Tool 🚀

[![VirusTotal Clean](https://shields.io)](https://www.virustotal.com/gui/file/03299850d732ed4c761112167e3cd8b886d267dd2d3d06ffa31e538925f537ba)
A lightweight, automated Windows Batch script designed to completely strip built-in advertisements from the LDPlayer emulator using advanced local Data Poisoning and NTFS directory hardening. It prevents the emulator from saving or rendering startup splash screens, sidebar promotions, and dynamic ad recommendation grids.

## ✨ Features
- Zero Startup Ads: Purges and hard-locks local splash files to prevent promotional banners when launching the emulator.
- NTFS Directory Hardening: Cleans out the AppData ad cache and recommendation models, replacing them with unbreakable write-protected placeholders.
- Performance Boost: Saves RAM and CPU cycles by preventing LDPlayer from processing and rendering heavy background image assets.
- 1-Click Automation: No complex PowerShell commands, no third-party network tools, and zero risk of system crashes.

## 🔓 Open-Source and Safe
This tool is 100% open-source and human-readable. The .bat script does not contain any compiled binaries, obfuscated code, or hidden tracking scripts. You can easily inspect, read, and verify every single line of code yourself by simply opening the file with Notepad (Blocco Note) before running it.

## 🚀 How to Use

1. Download the LDPlayer-Ad-Blocker.bat file from this repository.
2. Completely close LDPlayer and all its background processes.
3. Right-click on the downloaded .bat file and select "Run as administrator" (required to allow Windows to modify folder permissions and apply NTFS write blocks).
4. Wait for the green success window: Operation Complete.
5. Open LDPlayer and enjoy a clean, ad-free environment!

## ⚙️ How it Works
The script performs a clean multi-step local environment hardening process:
1. Terminates active backend processes (dnplayer.exe, ldnews.exe, ldbox.exe) to safely release file handles.
2. Grants permissions to current ad assets folders, purges them entirely, and creates empty static dummy items.
3. Denies system-level write permissions (icacls /deny everyone:(W)) to those target folders. When LDPlayer contacts its servers to fetch new advertisements, Windows intercepts the action with an "Access Denied" response, forcing the emulator to bypass ad rendering entirely.

## ⚠️ Disclaimer
This project is an independent open-source script. It is not affiliated, associated, authorized, endorsed by, or in any way officially connected with LDPlayer or its subsidiaries. Use at your own discretion.
