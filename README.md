# 🚀 Windows Update Automation Script  

This **PowerShell script** automates the process of **checking for and installing Windows updates** on your machine.  
Developed by **Tycho Löke** and distributed by **PeopleRock B.V.**, this script ensures your system stays up to date while maintaining detailed logs for transparency.  

## 📌 Features  
✅ **Automated Windows Updates** – Checks for and installs updates seamlessly.  
✅ **Module Installation Handling** – Ensures **NuGet** and **PSWindowsUpdate** are installed before execution.  
✅ **Detailed Logging** – Creates a transcript at `C:\temp\windowsupdate.log` for easy troubleshooting.  
✅ **User-Friendly Output** – Provides clear status updates during execution.  
✅ **Non-Interruptive Execution** – Updates are installed **without forcing a reboot**.  

## 🛠 Prerequisites  
Before running the script, ensure you meet the following requirements:  

- **Operating System**: Windows 7 or later  
- **PowerShell Version**: 3.0 or higher  
- **Administrator Privileges**: Run PowerShell as an administrator  

## 🚀 How to Use  

### **1️⃣ Download the Script**  
Clone this repository or download the script file manually.  

```powershell
git clone https://github.com/your-repo/windows-update-script.git
cd windows-update-script
```

### **2️⃣ Run PowerShell as Administrator**  
- Open **PowerShell** with elevated permissions (`Run as Administrator`).  

### **3️⃣ Execute the Script**  
Run the script using:  

```powershell
.\Windows-Update.ps1
```

### **4️⃣ What Happens Next?**  
✅ The script **checks for required modules** (`NuGet` & `PSWindowsUpdate`).  
✅ If missing, it **installs them automatically**.  
✅ The script **imports the PSWindowsUpdate module**.  
✅ It then **checks for available updates** and **installs them**.  
✅ Logs are stored at: `C:\temp\windowsupdate.log`.  

## 🔎 Notes  
- The script uses `-IgnoreReboot` to **prevent automatic restarts**.  
- The script applies `-AcceptAll` to install updates **without confirmation prompts**.  
- If `C:\temp` does not exist, it **creates the directory** automatically.  
- The log file **appends new logs** instead of overwriting them.  

## 🛠 Troubleshooting  

### **❌ Script Fails to Install Modules?**  
- Ensure you have **internet connectivity**.  
- Check your **PowerShell execution policy** (`Get-ExecutionPolicy`).  
- Run `Set-ExecutionPolicy RemoteSigned -Scope Process` if needed.  

### **❌ Script Unable to Import PSWindowsUpdate?**  
- Verify that the module is installed:  
  ```powershell
  Get-Module -Name PSWindowsUpdate -ListAvailable
  ```
- If missing, manually install it:  
  ```powershell
  Install-Module PSWindowsUpdate -Force
  ```

### **❌ Script Returns an Error?**  
- Check the **log file** at `C:\temp\windowsupdate.log`.  
- Run the script with **`-Verbose`** for detailed output:  
  ```powershell
  .\Windows-Update.ps1 -Verbose
  ```  

## 🤝 Contributing  
Want to improve this script? Contributions are welcome!  

**To contribute:**  
1. **Fork** the repository.  
2. **Create a feature branch** (`git checkout -b feature-name`).  
3. **Submit a Pull Request** with your changes.  

## 📜 License  
This project is licensed under the **MIT License** – feel free to use, modify, and distribute it.  
