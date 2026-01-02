#!/bin/bash

# Bash automation
./bash/system-update.sh
./bash/security-update.sh

# Python monitoring & patching
python3 python/system_monitor.py
python3 python/patch_manager.py --security-only

# PowerShell simulation
pwsh powershell/windows-patch-sim.ps1
