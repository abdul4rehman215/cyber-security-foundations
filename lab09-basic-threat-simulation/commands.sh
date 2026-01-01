#!/bin/bash

# Verify Nmap
nmap --version

# Start services
sudo systemctl start ssh
sudo systemctl start apache2
sudo systemctl status ssh apache2

# Basic scan
nmap 127.0.0.1

# Full port scan
nmap -p- 127.0.0.1
nmap -F 127.0.0.1
nmap -p 22,80,443,8080 127.0.0.1

# TCP / UDP scans
nmap -sS 127.0.0.1
sudo nmap -sU 127.0.0.1
sudo nmap -sS -sU 127.0.0.1

# Enumeration
nmap -sV 127.0.0.1
sudo nmap -O 127.0.0.1
nmap -sC 127.0.0.1
nmap --script vuln 127.0.0.1
nmap --script http-enum 127.0.0.1

# Comprehensive scan
sudo nmap -A 127.0.0.1 -oA comprehensive_scan
