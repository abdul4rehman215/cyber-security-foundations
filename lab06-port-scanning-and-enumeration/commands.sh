# Network interfaces
ip addr show
ifconfig

# Listening services
netstat -tuln
ss -tuln

# Nmap verification
nmap --version

# Basic scans
nmap 127.0.0.1
nmap -p 1-1000 127.0.0.1
nmap -sV 127.0.0.1

# Advanced scans
sudo nmap -sV -O 127.0.0.1
sudo nmap -A 127.0.0.1
sudo nmap -p- 127.0.0.1

# UDP scans
sudo nmap -sU 127.0.0.1
sudo nmap -sU -p 53,67,68,123,161 127.0.0.1

# Scan types
sudo nmap -sS 127.0.0.1
nmap -sT 127.0.0.1
sudo nmap -sA 127.0.0.1

# Nmap scripts
nmap -sC 127.0.0.1
nmap --script vuln 127.0.0.1
nmap --script http-enum 127.0.0.1

# Output formats
nmap -oN scan_results.txt 127.0.0.1
nmap -oX scan_results.xml 127.0.0.1
nmap -oG scan_results.gnmap 127.0.0.1
nmap -oA complete_scan 127.0.0.1

# Netcat
nc -h
nc -zv 127.0.0.1 22
nc -zv 127.0.0.1 20-25
nc 127.0.0.1 22

# Listener test (two terminals)
nc -l -p 1234
nc 127.0.0.1 1234

# Scripts
chmod +x scripts/*.sh
./scripts/identify_services.sh
./scripts/analyze_ports.sh
./scripts/security_report.sh
