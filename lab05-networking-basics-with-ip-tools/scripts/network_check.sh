#!/bin/bash

echo "=== Network Diagnostic Report ==="
echo "Date: $(date)"
echo

echo "=== IP Configuration ==="
ip addr show | grep inet | grep -v 127.0.0.1
echo

echo "=== Default Gateway ==="
ip route show | grep default
echo

echo "=== DNS Servers ==="
grep nameserver /etc/resolv.conf
echo

echo "=== Connectivity Tests ==="
ping -c 2 8.8.8.8 | tail -n 2
