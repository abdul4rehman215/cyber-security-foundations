#!/usr/bin/env pwsh

Write-Host "=== Windows Security Policy Simulation ===" -ForegroundColor Cyan

$SecurityPolicies = @{
    PasswordComplexity        = "Enabled"
    MinPasswordLength         = 12
    AccountLockoutThreshold   = 5
    MaxPasswordAge            = 90
    AuditLogonEvents          = "Enabled"
    FirewallStatus            = "Enabled"
}

$SecurityPolicies | ConvertTo-Json -Depth 3 |
    Out-File -Encoding utf8 ../config/security-config.json

$RegistrySettings = @{
    DisableAutoRun  = $true
    EnableFirewall  = $true
    DisableGuest    = $true
    EnableUAC       = $true
    EnableDefender  = $true
}

$RegistrySettings | ConvertTo-Json -Depth 3 |
    Out-File -Encoding utf8 ../config/registry-security.json

Write-Host "Security configuration completed successfully." -ForegroundColor Green
