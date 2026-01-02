#!/bin/bash
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_DIR="/tmp/ir_collection_${TIMESTAMP}"
mkdir -p ${OUTPUT_DIR}

uname -a > ${OUTPUT_DIR}/system_info.txt
hostname >> ${OUTPUT_DIR}/system_info.txt
uptime >> ${OUTPUT_DIR}/system_info.txt

ps auxf > ${OUTPUT_DIR}/processes.txt
sudo netstat -antp > ${OUTPUT_DIR}/network_connections.txt
sudo ss -tulpn > ${OUTPUT_DIR}/listening_ports.txt

who > ${OUTPUT_DIR}/logged_in_users.txt
last -20 > ${OUTPUT_DIR}/recent_logins.txt

sudo cp /var/log/auth.log ${OUTPUT_DIR}/auth.log

tar -czf ${OUTPUT_DIR}.tar.gz ${OUTPUT_DIR}
echo "Collection complete: ${OUTPUT_DIR}.tar.gz"
