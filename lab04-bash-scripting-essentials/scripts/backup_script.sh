#!/bin/bash

SOURCE="$HOME/test_data"
DEST="$HOME/backups/backup_$(date +%Y%m%d_%H%M%S)"

mkdir -p "$DEST"
echo "Created backup directory: $DEST"
echo "Starting backup process..."
cp -r "$SOURCE" "$DEST"
echo "Backup completed successfully!"
du -sh "$DEST"
