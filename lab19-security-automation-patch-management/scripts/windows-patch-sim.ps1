#!/usr/bin/env pwsh
$LogFile = "/var/log/windows-patch-sim.log"

function Write-LogMessage {
    param([string]$Message,[string]$Level="INFO")
    $ts = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$ts [$Level] $Message" | Tee-Object -FilePath $LogFile -Append
}

function Test-WindowsUpdates {
    Write-LogMessage "Checking for Windows updates..."
    return @(
        @{Title="KB501"; IsSecurityUpdate=$true; Severity="High"},
        @{Title="KB502"; IsSecurityUpdate=$false; Severity="Low"}
    )
}

function Install-WindowsUpdates {
    param($Updates,[switch]$SecurityOnly)
    $filtered = $SecurityOnly ? $Updates | Where-Object {$_.IsSecurityUpdate} : $Updates
    foreach ($u in $filtered) {
        Write-LogMessage "Installing $($u.Title)"
        Start-Sleep 1
    }
    return $filtered.Count
}

function Start-PatchManagement {
    param([switch]$SecurityOnly)
    $updates = Test-WindowsUpdates
    $count = Install-WindowsUpdates -Updates $updates -SecurityOnly:$SecurityOnly
    Write-LogMessage "$count updates installed"
}

Start-PatchManagement
