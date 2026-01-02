#!/bin/bash

# Install required tools
sudo apt update
sudo apt install auditd audispd-plugins inotify-tools -y

# Enable auditd
sudo systemctl enable auditd
sudo systemctl start auditd

# Verify audit subsystem
auditctl -s

# Execute scripts
bash scripts/audit_report.sh
bash scripts/file_integrity_checker.sh -c
bash scripts/file_integrity_checker.sh -s
bash scripts/critical_dirs_monitor.sh
