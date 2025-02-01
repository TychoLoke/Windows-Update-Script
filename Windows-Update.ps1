<#
.SYNOPSIS
    Windows Update Automation Script

.DESCRIPTION
    This script automates Windows Updates by:
    - Ensuring required modules are installed
    - Checking and installing Windows updates
    - Logging actions for debugging purposes

.AUTHOR
    Tycho Löke - PeopleRock B.V.

.LICENSE
    MIT License - Free to use and distribute
#>

# Define logging path
$LogDirectory = "C:\temp"
$LogFile = "$LogDirectory\windowsupdate.log"

# Ensure the log directory exists
if (!(Test-Path -Path $LogDirectory)) {
    New-Item -ItemType Directory -Force -Path $LogDirectory | Out-Null
}

# Start logging
Start-Transcript -Path $LogFile -Append -ErrorAction SilentlyContinue

Write-Output "`n========================="
Write-Output "  Windows Update Script  "
Write-Output "=========================`n"

# Function to check and install missing modules
function Ensure-Module {
    param (
        [string]$ModuleName,
        [string]$ProviderName = $null
    )
    try {
        if (!(Get-Module -Name $ModuleName -ListAvailable)) {
            Write-Output "[INFO] Installing module: $ModuleName"
            if ($ProviderName -and !(Get-PackageProvider -Name $ProviderName -ListAvailable)) {
                Install-PackageProvider -Name $ProviderName -Force -SkipPublisherCheck -ErrorAction Stop
            }
            Install-Module -Name $ModuleName -Force -SkipPublisherCheck -ErrorAction Stop
        } else {
            Write-Output "[INFO] Module already installed: $ModuleName"
        }
    } catch {
        Write-Output "[ERROR] Failed to install module $ModuleName: $_"
        Exit 1
    }
}

# Ensure required modules are installed
Ensure-Module -ModuleName "PSWindowsUpdate" -ProviderName "NuGet"

# Import the PSWindowsUpdate module
try {
    Import-Module PSWindowsUpdate -Force -ErrorAction Stop
    Write-Output "[SUCCESS] PSWindowsUpdate module imported."
} catch {
    Write-Output "[ERROR] Could not import PSWindowsUpdate module: $_"
    Exit 1
}

# Function to check and install Windows updates
function Run-WindowsUpdate {
    try {
        Write-Output "`n[INFO] Checking for Windows updates..."
        $Updates = Get-WindowsUpdate -IgnoreReboot
        if ($Updates) {
            Write-Output "[INFO] Updates available, proceeding with installation..."
            Install-WindowsUpdate -AcceptAll -IgnoreReboot | Out-String | Write-Output
            Write-Output "[SUCCESS] Windows updates installed successfully!"
        } else {
            Write-Output "[INFO] No updates available."
        }
    } catch {
        Write-Output "[ERROR] Windows Update process failed: $_"
        Exit 1
    }
}

# Run the Windows Update process
Run-WindowsUpdate

# Stop logging
Stop-Transcript
