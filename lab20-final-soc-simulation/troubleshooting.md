# 🛠 Troubleshooting – Lab 20

## Suricata Issues
- Verify interface (eth0)
- systemctl status suricata
- tail -f /var/log/suricata/suricata.log

## Fail2Ban Issues
- fail2ban-client status
- Check auth.log path
- Restart service

## Scripts Not Running
- chmod +x /opt/soc/scripts/*
- python3 -m py_compile script.py

## IP Blocking Fails
- sudo iptables -L -n
- Ensure sudo privileges
