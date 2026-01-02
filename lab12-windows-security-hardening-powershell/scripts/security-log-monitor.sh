#!/bin/bash
LOG_FILE="$HOME/security-lab/logs/security-monitor-$(date +%Y%m%d).log"

echo "[$(date)] Security monitoring started" >> "$LOG_FILE"
sudo grep "authentication failure" /var/log/auth.log 2>/dev/null >> "$LOG_FILE"
sudo grep -Ei "error|warning" /var/log/syslog 2>/dev/null >> "$LOG_FILE"
ss -tuln >> "$LOG_FILE"
