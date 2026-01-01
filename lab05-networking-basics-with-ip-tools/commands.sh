# Interface information
ip addr show
ip a
ifconfig

# IP and routing
hostname -I
ip route show

# Connectivity tests
ping -c 4 127.0.0.1
ping -c 4 172.31.0.1
ping -c 4 8.8.8.8
ping -c 4 google.com
ping -c 4 -s 1000 google.com
ping -c 4 -D google.com

# Traceroute
sudo apt install traceroute -y
traceroute google.com
traceroute -n 8.8.8.8

# DNS tools
nslookup google.com
nslookup 8.8.8.8
sudo apt install dnsutils -y
dig google.com
dig +short google.com
dig google.com MX
dig google.com NS
dig google.com TXT
dig +trace google.com
cat /etc/resolv.conf

# Diagnostic script
chmod +x scripts/network_check.sh
./scripts/network_check.sh

# Performance checks
for size in 64 128 512 1024; do
  ping -c 3 -s $size google.com | grep "min/avg/max"
done

watch -n 2 'ip -s link'

# Port checks
sudo apt install netcat -y
nc -zv 127.0.0.1 22
nc -zv 127.0.0.1 80
nc -zv 127.0.0.1 443

# Listening services
ss -tuln
ss -tuln | grep LISTEN
