# 🛠 Troubleshooting – Lab 12

## PowerShell Script Permission Errors
chmod +x script.ps1

## Missing Authentication Logs
Use sudo grep on /var/log/auth.log

## False Positives in Change Detection
Recreate baselines after system stabilization

## Cron Not Executing
systemctl status cron
grep CRON /var/log/syslog
