#!/bin/bash

DIR="/home/forensics/reports"
mkdir -p "$DIR"
FILE="$DIR/forensic_report_$(date +%Y%m%d_%H%M%S).txt"

{
 echo "FORENSIC REPORT"
 date
 echo "System: $(hostname)"
 echo ""
 echo "Findings Summary:"
 grep -i "Potential" /home/forensics/unauthorized_analysis_*/findings.txt 2>/dev/null
 echo ""
 echo "Recommendations:"
 echo "- Review authentication logs"
 echo "- Disable unauthorized services"
 echo "- Patch system and rotate credentials"
} > "$FILE"

echo "Report generated: $FILE"
