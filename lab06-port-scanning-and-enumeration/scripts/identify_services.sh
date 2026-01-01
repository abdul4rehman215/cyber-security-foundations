#!/bin/bash

echo "=== Service Identification Report ==="
echo "Open TCP Ports:"
ss -tuln | grep LISTEN | awk '{print $5}'

echo
echo "Listening Services:"
ss -tuln | grep LISTEN
