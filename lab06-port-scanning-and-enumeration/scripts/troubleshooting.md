# 🛠️ Troubleshooting – Lab 06

## Issue: nmap command not found
Install Nmap:
sudo apt install nmap -y

## Issue: Permission denied during scans
Use sudo for privileged scans:
sudo nmap -sS -O target

## Issue: netstat not available
Install net-tools:
sudo apt install net-tools -y

## Issue: Netcat not installed
Install Netcat:
sudo apt install netcat -y
