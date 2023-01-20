
# Windows Update Script

This PowerShell script, authored by Tycho Loke and distributed by PeopleRock B.V, allows you to check for and install Windows updates on a machine. The script logs its output to a specified file.

## Prerequisites
- A machine running Windows 7 or later.
- PowerShell version 3 or later.
- Administrator permissions on the machine.

## Usage
1. Clone or download the script from this repository.
2. Open a PowerShell window with elevated permissions.
3. Run the script by typing .\Windows-Update.ps1.
4. The script will check if the necessary modules and packages (NuGet and PSWindowsUpdate) are installed. If they are not, the script will install them asynchronously.
5. The script will then import the PSWindowsUpdate module.
6. The script will check for available updates and install them.
7. The script will log its output to the specified file (C:\temp\windowsupdate.log).

## Notes
- The script uses the -IgnoreReboot switch when running Get-WindowsUpdate and Install-WindowsUpdate, so the machine will not reboot during the installation process.
- The script uses the -AcceptAll switch when running Install-WindowsUpdate to accept all the updates without prompting for confirmation.
- The script uses the -RequiredVersion switch when installing the NuGet package provider to a specific version.
- The script uses the -IncludeDependencies switch when bootstrapping the NuGet package provider to install any additional dependencies.
- The script uses the -force switch for Find-PackageProvider instead of Find-Package
- The script will overwrite the log file if it already exists.

## Troubleshooting
- If the script is unable to install the necessary modules and packages, check that you have internet connectivity and that your PowerShell execution policy allows for the installation of modules.
- If the script returns an error message, check the log file and the script's output for more information.
- If the script is unable to import the PSWindowsUpdate module, check that the module is installed and that your PowerShell execution policy allows for the import of modules.

## Contribution
If you want to improve this script, please feel free to open a pull request.

## License
This script is licensed under the MIT license.



