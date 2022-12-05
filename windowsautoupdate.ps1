#Powershell Script Windows Update
#Author: Tycho Loke
#Distirbution: PeopleRock B.V.
 
Start-Transcript -Path "C:\temp\windowsupdate.log"
 
$installnuget = Start-Job -ScriptBlock{
    Find-PackageProvider -Name 'Nuget' -ForceBootstrap -IncludeDependencies
    Install-PackageProvider -Name "NuGet" -RequiredVersion "2.8.5.208" -force
    Install-Module PSWindowsUpdate -force
}
 
Wait-Job $installnuget
Write-Host "install done"
 
Import-Module PSWindowsUpdate -force 
Write-Host "import done"
 
Get-WindowsUpdate -IgnoreReboot
Install-WindowsUpdate -AcceptAll -IgnoreReboot
 
Stop-Transcript 
