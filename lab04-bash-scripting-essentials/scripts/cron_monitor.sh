#!/bin/bash

echo "Cron Job Monitoring Dashboard"
echo "============================="

systemctl is-active cron >/dev/null && echo "✓ Cron service is running"

COUNT=$(ls $HOME/cron_backups 2>/dev/null | wc -l)
echo "Number of backups: $COUNT"

df -h /
echo "Monitoring complete!"
