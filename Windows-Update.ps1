# Powershell Script Windows Update
# Author: Tycho Loke
# Distribution: PeopleRock B.V.

# Start transcript to log the output of the script
Start-Transcript -Path "C:\temp\windowsupdate.log"

# Asynchronously install the necessary modules and packages
$installNuGet = Start-Job -ScriptBlock {
    # Check if the NuGet package provider is installed, if not, install it
    if (!(Get-PackageProvider -Name 'Nuget' -ListAvailable)) {
        Find-PackageProvider -Name 'Nuget' -ForceBootstrap -IncludeDependencies
        Install-PackageProvider -Name "NuGet" -RequiredVersion "2.8.5.208" -Force
    }
    # Check if the PSWindowsUpdate module is installed, if not, install it
    if (!(Get-Module -Name PSWindowsUpdate -ListAvailable)) {
        Install-Module PSWindowsUpdate -Force
    }
}

# Wait for the job to complete
Wait-Job $installNuGet
Write-Host "Modules and packages installed"

# Import the PSWindowsUpdate module
Import-Module PSWindowsUpdate -Force
Write-Host "PSWindowsUpdate module imported"

# Get and install available updates
Get-WindowsUpdate -IgnoreReboot
Install-WindowsUpdate -AcceptAll -IgnoreReboot

# Stop transcript
Stop-Transcript
