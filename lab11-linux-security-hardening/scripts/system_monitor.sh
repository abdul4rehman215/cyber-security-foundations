#!/bin/bash
echo "CPU:"
top -bn1 | head -5

echo -e "\nMemory:"
free -h

echo -e "\nDisk:"
df -h /

echo -e "\nListening Ports:"
sudo ss -tlnp
