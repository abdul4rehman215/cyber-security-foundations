#!/bin/bash

LOG="$HOME/cron_backup.log"
DEST="$HOME/cron_backups/backup_$(date +%Y%m%d_%H%M%S)"

mkdir -p "$DEST"
cp -r "$HOME/scripts" "$DEST"

echo "$(date) [CRON-BACKUP] SUCCESS: scripts backed up successfully" >> "$LOG"
