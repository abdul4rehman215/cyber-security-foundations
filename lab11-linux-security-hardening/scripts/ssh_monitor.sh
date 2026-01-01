#!/bin/bash
THRESHOLD=5
FAILED=$(sudo journalctl -u sshd --since "1 hour ago" | grep "Failed password" | wc -l)

if [ "$FAILED" -gt "$THRESHOLD" ]; then
 echo "[ALERT] High SSH failures detected: $FAILED"
 sudo journalctl -u sshd --since "1 hour ago" | grep "Failed password" | awk '{print $11}' | sort | uniq -c
fi
