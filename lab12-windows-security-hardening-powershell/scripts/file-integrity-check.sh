#!/bin/bash
LOG_FILE="$HOME/security-lab/logs/integrity-check-$(date +%Y%m%d).log"
BASELINE="$HOME/security-lab/config/baselines"

mkdir -p "$BASELINE"

FILES=(/etc/passwd /etc/shadow /etc/sudoers /etc/ssh/sshd_config)

for file in "${FILES[@]}"; do
 hash="$BASELINE/$(basename $file).sha256"
 current=$(sudo sha256sum "$file" | awk '{print $1}')

 if [ ! -f "$hash" ]; then
   echo "$current" | sudo tee "$hash" >/dev/null
 else
   old=$(cat "$hash")
   [ "$current" != "$old" ] && echo "ALERT: $file modified" >> "$LOG_FILE"
 fi
done
