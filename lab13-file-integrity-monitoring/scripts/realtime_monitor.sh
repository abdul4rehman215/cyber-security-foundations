#!/bin/bash
LOG="$HOME/realtime_monitor.log"
echo "Monitoring started at $(date)" > "$LOG"

inotifywait -m -r -e modify,create,delete,attrib "$HOME/secure_files" \
--format '%T %e %f' --timefmt '%F %T' | while read line; do
 echo "$line" | tee -a "$LOG"
done
