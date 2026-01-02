#!/bin/bash
CRITICAL_DIRS=(/etc /usr/bin /usr/sbin /home/toor/secure_files)
LOG="$HOME/monitoring_logs/critical_monitor.log"

mkdir -p ~/monitoring_logs

for dir in "${CRITICAL_DIRS[@]}"; do
 sudo auditctl -w "$dir" -p rwxa -k "critical_$(basename $dir)"
done

sudo ausearch -ts today > "$LOG"
echo "Monitoring complete. Log: $LOG"
