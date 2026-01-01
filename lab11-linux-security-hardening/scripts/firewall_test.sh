#!/bin/bash
echo "=== UFW Firewall Status Test ==="
sudo ufw status verbose

echo -e "\n=== Outgoing Connectivity Test ==="
ping -c 3 google.com

echo -e "\n=== Listening Ports ==="
sudo ss -tlnp

echo -e "\n=== Recent UFW Logs ==="
sudo tail -10 /var/log/ufw.log 2>/dev/null || echo "No UFW logs yet"
