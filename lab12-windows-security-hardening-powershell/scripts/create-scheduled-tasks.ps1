#!/usr/bin/env pwsh

$ScheduledTasks = @(
    @{ Name="SecurityLogMonitor"; Schedule="Every 15 minutes"; Status="Enabled" },
    @{ Name="FileIntegrityCheck"; Schedule="Daily 02:00"; Status="Enabled" },
    @{ Name="UnauthorizedChangeDetector"; Schedule="Hourly"; Status="Enabled" },
    @{ Name="SecurityReportGenerator"; Schedule="Daily 03:00"; Status="Enabled" }
)

$ScheduledTasks | ConvertTo-Json -Depth 3 |
    Out-File -Encoding utf8 ../config/scheduled-tasks.json

@"
*/15 * * * * $HOME/security-lab/scripts/security-log-monitor.sh
0 2 * * * $HOME/security-lab/scripts/file-integrity-check.sh
0 * * * * $HOME/security-lab/scripts/change-detector.sh
0 3 * * * $HOME/security-lab/scripts/security-report.sh
"@ | Out-File ../config/crontab-security
