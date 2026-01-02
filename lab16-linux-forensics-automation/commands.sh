#!/bin/bash

# Directory preparation
sudo mkdir -p /home/forensics/{logs,processes,network,scripts,analysis,system_info}
sudo chown -R toor:toor /home/forensics

# Manual collection
ps aux
ss -tulpn
journalctl --since "24 hours ago"

# Automated collection
chmod +x scripts/forensic_collector.sh
./scripts/forensic_collector.sh

# Analysis
chmod +x scripts/forensic_analyzer.py
python3 scripts/forensic_analyzer.py

# Detection
chmod +x scripts/detect_unauthorized.sh
./scripts/detect_unauthorized.sh

# Report generation
chmod +x scripts/generate_report.sh
./scripts/generate_report.sh
