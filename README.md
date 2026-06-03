# LDPlayer Ad-Removal Tool 🚀

A lightweight, automated Windows Batch script designed to completely strip built-in advertisements from the **LDPlayer** emulator. It cuts off ad downloads at the system level and locks internal cache directories to provide a clean, faster, and completely ad-free emulation experience.

## ✨ Features
- 🛑 **Zero Startup Ads:** No more waiting for promotional banners when launching the emulator.
- ⚡ **DNS & Hosts Redirection:** Hard-blocks `cdn.ldplayer.net` and `://ldrescdn.com` to prevent background ad downloads.
- 🔒 **Directory Hardening:** Wipes out the `XuanZhi9/cache` folder and replaces it with an unbreakable permission block.
- 🛠️ **1-Click Automation:** No manual folder-navigating or permission-tweaking required.
- 📊 **Real-time Verification:** Built-in self-test checks if the write-protection was applied successfully.

## 🔓 Open-Source & Safe
This tool is 100% open-source. The `.bat` script does not contain any compiled code or hidden binaries. You can easily inspect, read, and verify every single line of code yourself by simply opening the file with **Notepad (Blocco Note)** or any text editor before running it.

## 🚀 How to Use

1. **Download** the `LDPlayer-Ad-Blocker.bat` file from the Releases section.
2. Close LDPlayer completely.
3. Right-click on the `.bat` file and select **"Run as administrator"** (required to edit Windows Hosts and modify folder permissions).
4. Wait for the green success message: `[✓] Operation Complete`.
5. Open LDPlayer and enjoy an ad-free experience!

> 💡 **Pro-Tip:** For total ad-blocking coverage inside Android apps, change the **Private DNS** provider inside LDPlayer Android settings to `://adguard.com`.

## ⚙️ How it Works
The script performs a clean multi-step security hardening process:
1. Closes active LDPlayer backend processes (`dnplayer.exe`, `ldnews.exe`, `ldbox.exe`).
2. Appends null-routing targets (`0.0.0.0`) to your Windows `hosts` file for known LDPlayer ad distribution domains.
3. Purges current ad assets cached in `%AppData%\XuanZhi9`.
4. Creates dummy system placeholders and strips away all inheritance and user write permissions, ensuring LDPlayer can never recreate or download banner assets onto your disk again.

## ⚠️ Disclaimer
This project is an independent open-source script. It is not affiliated, associated, authorized, endorsed by, or in any way officially connected with LDPlayer or its subsidiaries. Use at your own discretion.
