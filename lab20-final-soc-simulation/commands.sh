#!/bin/bash

# SOC Analysis
python3 /opt/soc/scripts/log_analyzer.py

# Automated response
python3 /opt/soc/scripts/response_engine.py &

# Verification
sudo iptables -L INPUT -n
sudo fail2ban-client status sshd
