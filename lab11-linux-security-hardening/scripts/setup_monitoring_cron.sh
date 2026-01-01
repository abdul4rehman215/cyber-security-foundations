#!/bin/bash
(crontab -l 2>/dev/null; echo "0 * * * * $HOME/security_monitor_master.sh") | crontab -
(crontab -l 2>/dev/null; echo "*/15 * * * * $HOME/ssh_monitor.sh") | crontab -
crontab -l
