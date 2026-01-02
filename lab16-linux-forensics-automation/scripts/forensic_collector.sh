#!/bin/bash

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BASE_DIR="/home/forensics/automated_collection_$TIMESTAMP"

mkdir -p "$BASE_DIR"/{system_info,logs,processes,network,users}

{
 echo "Hostname: $(hostname)"
 uname -a
 uptime
 date
} > "$BASE_DIR/system_info/system_overview.txt"

{
 who
 last | head -20
 cat /etc/passwd
} > "$BASE_DIR/users/user_info.txt"

ps aux > "$BASE_DIR/processes/ps_aux.txt"
pstree -p > "$BASE_DIR/processes/pstree.txt"
lsof > "$BASE_DIR/processes/open_files.txt" 2>/dev/null

ss -an > "$BASE_DIR/network/connections.txt"
ss -tln > "$BASE_DIR/network/listening_ports.txt"
ip route > "$BASE_DIR/network/routes.txt"

sudo cp /var/log/auth.log "$BASE_DIR/logs/auth.log" 2>/dev/null
sudo journalctl --since "24 hours ago" > "$BASE_DIR/logs/system_journal.txt"

tar -czf "/home/forensics/forensic_collection_$TIMESTAMP.tar.gz" -C /home/forensics "automated_collection_$TIMESTAMP"

echo "Collection completed: $BASE_DIR"
