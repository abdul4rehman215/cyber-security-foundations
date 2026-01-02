#!/usr/bin/env pwsh
param(
    [string]$DataPath = "./samples",
    [string]$OutputPath = "./forensic_output"
)

New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null

function Analyze-EventLogs {
    param($Path)

    Get-ChildItem $Path -Filter *.json | ForEach-Object {
        $data = Get-Content $_ | ConvertFrom-Json
        $ids = $data.event_id | Group-Object | Sort-Object Count -Descending

        $result = @{
            File = $_.Name
            TotalEvents = $data.Count
            TopEventIDs = $ids | Select-Object -First 10
            Suspicious = $ids | Where-Object { $_.Name -in 4624,4625,4648,4672,7045 }
        }

        $result | ConvertTo-Json -Depth 4 |
        Out-File "$OutputPath/$($_.BaseName)_analysis.json"
    }
}

function Analyze-RegistryData {
    Get-ChildItem $DataPath/registry-hives -Filter *.json | ForEach-Object {
        $data = Get-Content $_ | ConvertFrom-Json
        $keywords = "password","key","token","secret"

        $hits = $data.values | Where-Object {
            $keywords | ForEach-Object { $_ -in $_.data }
        }

        $hits | ConvertTo-Json -Depth 4 |
        Out-File "$OutputPath/registry_analysis.json"
    }
}

function Create-ForensicReport {
@"
# Forensic Report

## Summary
Automated Windows forensic analysis completed.

## Findings
- Suspicious Event IDs detected
- Registry values with sensitive keywords

## Recommendations
- Investigate failed logins
- Review new services
- Monitor registry persistence
"@ | Out-File "$OutputPath/forensic_report.md"
}

Analyze-EventLogs "$DataPath/event-logs"
Analyze-RegistryData
Create-ForensicReport

Write-Host "Forensics complete"
