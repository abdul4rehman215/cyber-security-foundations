# 🛠 Troubleshooting – Lab 19

## Permission Errors
- Use sudo for system operations
- chmod +x scripts
- Verify log directory permissions

## Cron Jobs Not Running
- systemctl status cron
- Use absolute paths
- Check /var/log/syslog

## Python Import Errors
- pip3 install psutil
- Verify Python version

## Patch Script Issues
- Ensure unattended-upgrades installed
- Verify network connectivity
