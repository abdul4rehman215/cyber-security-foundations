#!/bin/bash
# System Update Automation Script

LOG_FILE="/var/log/system-update.log"

log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | sudo tee -a "$LOG_FILE"
}

update_package_lists() {
    log_message "Updating package lists..."
    if sudo apt update >> "$LOG_FILE" 2>&1; then
        log_message "Package list update successful"
    else
        log_message "Package list update failed"
        return 1
    fi
}

upgrade_packages() {
    log_message "Upgrading packages..."
    if sudo apt upgrade -y >> "$LOG_FILE" 2>&1; then
        log_message "Package upgrade successful"
    else
        log_message "Package upgrade failed"
        return 1
    fi
}

cleanup_system() {
    log_message "Cleaning up system..."
    sudo apt autoremove -y >> "$LOG_FILE" 2>&1
    sudo apt autoclean >> "$LOG_FILE" 2>&1
    log_message "System cleanup completed"
}

check_reboot_required() {
    if [ -f /var/run/reboot-required ]; then
        log_message "Reboot required after updates"
    else
        log_message "No reboot required"
    fi
}

main() {
    log_message "=== Starting automated system update ==="
    update_package_lists || exit 1
    upgrade_packages || exit 1
    cleanup_system
    check_reboot_required
    log_message "=== Update completed ==="
}

main
