#!/bin/bash

echo "Open ports found:"

ss -tuln | grep LISTEN | while read line; do
  port=$(echo "$line" | awk '{print $5}' | awk -F: '{print $NF}')
  case "$port" in
    22) echo "Port 22: SSH" ;;
    *) echo "Port $port: Unknown service" ;;
  esac
done
