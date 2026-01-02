#!/bin/bash

# Install required tools
sudo apt update
sudo apt install -y netstat-nat tcpdump aide chkrootkit

# Process and network inspection
ps aux
ps aux --sort=-%cpu
sudo netstat -tulpn
sudo ss -tulpn

# Containment
sudo kill -9 1842
sudo iptables -A OUTPUT -d 185.203.116.45 -j DROP
sudo iptables -A INPUT -s 185.203.116.45 -j DROP

# Evidence collection
chmod +x scripts/collect_evidence.sh
sudo scripts/collect_evidence.sh

# Evidence hashing
sha256sum evidence/*.tar.gz > evidence/evidence_hashes.txt
