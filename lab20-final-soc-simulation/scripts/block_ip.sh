#!/bin/bash
IP_ADDRESS="$1"
REASON="$2"
LOG_FILE="/opt/soc/logs/blocked_ips.log"

sudo iptables -A INPUT -s "$IP_ADDRESS" -j DROP
echo "$(date) BLOCKED $IP_ADDRESS REASON=$REASON" | tee -a "$LOG_FILE"

python3 /opt/soc/scripts/send_alert.py IP_BLOCKED "Blocked $IP_ADDRESS for $REASON"
