#!/bin/bash
sudo ufw status verbose
grep -E "Port|PermitRootLogin|PasswordAuthentication" /etc/ssh/sshd_config
systemctl status sshd --no-pager
crontab -l
