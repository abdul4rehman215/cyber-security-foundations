#!/bin/bash

OUT="/home/forensics/unauthorized_analysis_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUT"

{
 echo "UNAUTHORIZED ACTIVITY REPORT"
 date

 COUNT=$(grep -c "Failed password" /var/log/auth.log 2>/dev/null)
 if [ "$COUNT" -gt 20 ]; then
   echo "Potential brute force detected: $COUNT failures"
 fi

 ss -tln | grep -E "4444|5555|6666|1234|31337"
 grep "sudo:" /var/log/auth.log 2>/dev/null
} > "$OUT/findings.txt"

echo "Analysis saved to $OUT"
