#!/bin/bash

LOG="$HOME/backup_log.txt"
DIRS=("$HOME/test_data" "$HOME/scripts")
SUCCESS=0
FAIL=0

echo "$(date) - Starting advanced backup process" | tee -a "$LOG"

for DIR in "${DIRS[@]}"; do
  if [ -d "$DIR" ]; then
    DEST="$HOME/backups/backup_$(basename $DIR)_$(date +%H%M%S)"
    cp -r "$DIR" "$DEST"
    SIZE=$(du -sh "$DEST" | awk '{print $1}')
    echo "$(date) - SUCCESS: Backup completed for $DIR (Size: $SIZE)" | tee -a "$LOG"
    ((SUCCESS++))
  else
    echo "$(date) - FAILED: $DIR not found" | tee -a "$LOG"
    ((FAIL++))
  fi
done

echo "Successful backups: $SUCCESS" | tee -a "$LOG"
echo "Failed backups: $FAIL" | tee -a "$LOG"
