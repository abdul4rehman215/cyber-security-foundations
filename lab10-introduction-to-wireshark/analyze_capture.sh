#!/bin/bash

PCAP_FILE="capture.pcap"
REPORT_FILE="network_analysis_report.txt"

echo "Network Traffic Analysis Report" > "$REPORT_FILE"
echo "Generated on: $(date)" >> "$REPORT_FILE"
echo "=================================" >> "$REPORT_FILE"

echo -e "\n1. TOTAL PACKETS:" >> "$REPORT_FILE"
tshark -r "$PCAP_FILE" -q -z io,stat,0 >> "$REPORT_FILE"

echo -e "\n2. PROTOCOL DISTRIBUTION:" >> "$REPORT_FILE"
tshark -r "$PCAP_FILE" -q -z io,phs >> "$REPORT_FILE"

echo -e "\n3. TCP CONVERSATIONS:" >> "$REPORT_FILE"
tshark -r "$PCAP_FILE" -q -z conv,tcp | head -20 >> "$REPORT_FILE"

echo -e "\n4. DNS QUERIES:" >> "$REPORT_FILE"
tshark -r "$PCAP_FILE" -Y "dns.flags.response == 0" -T fields -e dns.qry.name | \
sort | uniq -c | sort -nr | head -10 >> "$REPORT_FILE"

echo -e "\n5. HTTP HOSTS:" >> "$REPORT_FILE"
tshark -r "$PCAP_FILE" -Y "http" -T fields -e http.host | \
sort | uniq -c | sort -nr >> "$REPORT_FILE"
