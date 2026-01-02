#!/bin/bash

# Install dependencies
pip3 install --user python-evtx python-registry

# Event log extraction
python3 scripts/extract_eventlogs.py samples/event-logs/System.evtx reports/system_events.json
python3 scripts/extract_eventlogs.py samples/event-logs/Security.evtx reports/security_events.json

# Registry extraction
python3 scripts/extract_registry.py samples/registry-hives/SYSTEM
python3 scripts/extract_registry.py samples/registry-hives/SOFTWARE

# PowerShell automation
pwsh -File scripts/forensic_automation.ps1

# IOC analysis
python3 scripts/analyze_activity.py
