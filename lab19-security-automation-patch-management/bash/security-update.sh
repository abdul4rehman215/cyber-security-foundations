#!/bin/bash
# Security Update Script

LOG_FILE="/var/log/security-update.log"

log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | sudo tee -a "$LOG_FILE"
}

check_security_updates() {
    log_message "Checking for security updates..."
    sudo apt update >> "$LOG_FILE" 2>&1
    SECURITY_UPDATES=$(apt list --upgradable 2>/dev/null | grep -i security | wc -l)
    log_message "Security updates available: $SECURITY_UPDATES"
}

install_security_updates() {
    log_message "Installing security updates..."
    sudo apt install -y unattended-upgrades >> "$LOG_FILE" 2>&1
    sudo unattended-upgrades >> "$LOG_FILE" 2>&1
    log_message "Security updates installed"
}

main() {
    log_message "=== Security update process started ==="
    check_security_updates
    install_security_updates
    log_message "=== Security update process completed ==="
}

mai
