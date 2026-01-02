# 🛠 Troubleshooting – Lab 13

## auditd Not Starting
sudo systemctl reset-failed auditd
sudo systemctl start auditd

## Permission Denied Errors
Run audit commands with sudo
Check directory permissions

## No Audit Events
sudo auditctl -l
sudo tail -f /var/log/audit/audit.log

## Script Errors
chmod +x *.sh
bash -n script_name.sh
