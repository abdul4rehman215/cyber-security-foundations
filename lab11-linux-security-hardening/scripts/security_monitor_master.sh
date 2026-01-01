#!/bin/bash
echo "=== Security Monitoring Dashboard ==="
~/ssh_monitor.sh
~/system_monitor.sh
~/log_analysis.sh
sudo ufw status verbose
