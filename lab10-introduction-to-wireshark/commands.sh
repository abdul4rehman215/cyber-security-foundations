#!/bin/bash

# Update system and install Wireshark
sudo apt update
sudo apt install wireshark -y
sudo apt install curl wget dnsutils -y

# Configure permissions
sudo usermod -a -G wireshark toor
sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap
getcap /usr/bin/dumpcap

# List interfaces
tshark -D

# Identify interface
ip addr show ens5

# Capture traffic
sudo tshark -i ens5 -c 150 -w capture.pcap

# Generate traffic
curl -I http://httpbin.org/get
nslookup google.com
dig facebook.com
curl -I https://www.google.com
ping -c 10 8.8.8.8

# Export traffic
tshark -r capture.pcap -Y "http" -w http_traffic.pcap
tshark -r capture.pcap -Y "http" -T csv > http_traffic.csv

# Statistics
tshark -r capture.pcap -q -z io,phs
tshark -r capture.pcap -q -z conv,tcp
