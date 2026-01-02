#!/bin/bash
REPORT="$HOME/security-lab/logs/security-analysis-$(date +%Y%m%d-%H%M).log"

sudo grep "authentication failure" /var/log/auth.log | wc -l >> "$REPORT"
sudo grep -Ei "error|critical" /var/log/syslog | wc -l >> "$REPORT"
ps aux --sort=-%cpu | head -6 >> "$REPORT"
df -h | awk '$5+0 > 90 {print "ALERT:", $0}' >> "$REPORT"
