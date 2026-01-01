#!/bin/bash

# UFW installation and setup
sudo apt update
sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw enable
sudo ufw status verbose

# SSH hardening
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
sudo ssh-keygen -t rsa -b 4096 -C "lab11@security.local"

# Logging
sudo journalctl -u sshd
sudo journalctl | grep sudo
sudo journalctl | grep UFW
