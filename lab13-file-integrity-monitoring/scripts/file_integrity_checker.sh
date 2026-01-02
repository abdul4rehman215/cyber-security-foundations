#!/bin/bash
MONITOR_DIR="$HOME/secure_files"
BASELINE="$HOME/file_baselines.txt"
REPORT="$HOME/integrity_report_$(date +%Y%m%d_%H%M%S).txt"

create_baseline() {
 find "$MONITOR_DIR" -type f -exec md5sum {} \; > "$BASELINE"
 echo "Baseline created."
}

scan_files() {
 echo "Integrity Report - $(date)" > "$REPORT"
 while read -r hash file; do
   if [ -f "$file" ]; then
     current=$(md5sum "$file" | awk '{print $1}')
     [ "$hash" != "$current" ] && echo "CHANGED: $file" >> "$REPORT"
   else
     echo "DELETED: $file" >> "$REPORT"
   fi
 done < "$BASELINE"
 cat "$REPORT"
}

case "$1" in
 -c) create_baseline ;;
 -s) scan_files ;;
 *) echo "Usage: $0 -c | -s" ;;
esac
