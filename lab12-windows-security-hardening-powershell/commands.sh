#!/bin/bash

# Verify PowerShell
pwsh --version

# Create lab structure
mkdir -p ~/security-lab/{scripts,logs,config,monitoring,config/baselines}

# Run PowerShell security configuration
pwsh scripts/security-config.ps1

# Create scheduled task simulation
pwsh scripts/create-scheduled-tasks.ps1

# Execute monitoring scripts
bash scripts/security-log-monitor.sh
bash scripts/file-integrity-check.sh
bash scripts/advanced-log-monitor.sh
bash scripts/change-detector.sh
bash scripts/security-report.sh
