#!/bin/bash

REPORT="security_report.txt"

echo "=== SECURITY ASSESSMENT REPORT ===" | tee $REPORT
echo "Target: localhost (127.0.0.1)" | tee -a $REPORT
echo | tee -a $REPORT

echo "Open Ports:" | tee -a $REPORT
ss -tuln | grep LISTEN | tee -a $REPORT

echo | tee -a $REPORT
echo "Recommendation: Close unused services" | tee -a $REPORT

echo "Security report saved successfully"
