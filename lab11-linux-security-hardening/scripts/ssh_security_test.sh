#!/bin/bash
echo "=== SSH Security Test ==="
sudo systemctl status sshd --no-pager

echo -e "\nSSH Configuration:"
grep -E "^(Port|PermitRootLogin|PasswordAuthentication|MaxAuthTries)" /etc/ssh/sshd_config

echo -e "\nSSH Keys:"
ls -l ~/.ssh

echo -e "\nActive Sessions:"
who
