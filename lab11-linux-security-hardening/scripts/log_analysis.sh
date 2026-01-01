#!/bin/bash
echo "=== Security Log Analysis ==="
date

echo -e "\nFailed SSH attempts (24h):"
sudo journalctl -u sshd --since "24 hours ago" | grep "Failed password" | wc -l

echo -e "\nRecent Failed Attempts:"
sudo journalctl -u sshd --since "24 hours ago" | grep "Failed password" | tail -5

echo -e "\nRecent Successful Logins:"
sudo journalctl -u sshd --since "24 hours ago" | grep "Accepted" | tail -5

echo -e "\nSudo Usage:"
sudo journalctl --since "24 hours ago" | grep "sudo:" | wc -l

echo -e "\nFirewall Blocks:"
sudo journalctl --since "24 hours ago" | grep "UFW BLOCK" | wc -l

df -h
free -h
who
