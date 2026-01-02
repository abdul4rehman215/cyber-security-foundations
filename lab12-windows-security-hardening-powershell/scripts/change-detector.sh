#!/bin/bash
LOG="$HOME/security-lab/logs/change-detection-$(date +%Y%m%d).log"
BASE="$HOME/security-lab/config/baselines"

FILES=(/etc/passwd /etc/shadow /etc/hosts /etc/ssh/sshd_config)

for f in "${FILES[@]}"; do
 stat_file="$BASE/$(basename $f).stat"
 current=$(stat -c "%Y %s %a" "$f")

 if [ ! -f "$stat_file" ]; then
   echo "$current" > "$stat_file"
 else
   old=$(cat "$stat_file")
   [ "$current" != "$old" ] && echo "ALERT: File change detected -> $f" >> "$LOG"
 fi
done
