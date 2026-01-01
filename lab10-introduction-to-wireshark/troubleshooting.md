# 🛠️ Troubleshooting – Lab 10

### Issue 1: Permission Denied
Ensure user is in wireshark group:
groups $USER
sudo usermod -a -G wireshark $USER
newgrp wireshark

### Issue 2: No Interfaces Available
Check interfaces:
ip link show
Restart network manager:
sudo systemctl restart NetworkManager

### Issue 3: Capture File Too Large
Use rotating files:
tshark -i eth0 -b filesize:100000 -b files:5 -w capture

### Issue 4: No Traffic Visible
Generate traffic:
ping -c 5 8.8.8.8
