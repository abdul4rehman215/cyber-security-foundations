# Directory setup
mkdir -p ~/python_automation_lab
cd ~/python_automation_lab
mkdir scripts data logs

# Create CSV data file
cat > data/network_devices.csv << EOF
server1,192.168.1.10,active
server2,192.168.1.11,inactive
server3,192.168.1.12,active
firewall1,192.168.1.1,active
EOF

# Run scripts
cd scripts
python3 file_reader.py
python3 log_writer.py
python3 folder_cleanup.py
python3 network_monitor.py
python3 password_checker.py

# Verification
cd ..
find . -name "*.py" -type f
find . -name "*.log" -type f
find . -name "*.csv" -type f
