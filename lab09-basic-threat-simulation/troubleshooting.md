# 🛠️ Troubleshooting – Lab 09

### Issue: Permission denied during scan
Use sudo for privileged scans.

### Issue: python-nmap not found
Install using:
pip3 install python-nmap

### Issue: No services detected
Ensure services are running:
sudo systemctl status ssh apache2

### Issue: Scan takes too long
Use faster scans:
nmap -F 127.0.0.1
