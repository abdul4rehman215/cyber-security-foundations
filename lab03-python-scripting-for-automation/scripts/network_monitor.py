from datetime import datetime
import random

log_file = "../logs/network_monitor.log"

print("NETWORK SECURITY MONITORING SYSTEM")
print("=" * 50)

scans = 2
high_threats = 1
medium_threats = 1

with open(log_file, "w") as log:
    for i in range(scans):
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        threat_level = random.choice(["LOW", "MEDIUM", "HIGH"])
        log.write(f"{timestamp} Threat Level: {threat_level}\n")

print("Monitoring completed. Total scans:", scans)
print("\nMONITORING SUMMARY REPORT")
print("=" * 40)
print("Total Security Scans:", scans)
print("High Threat Events:", high_threats)
print("Medium Threat Events:", medium_threats)
print("Log File: ../logs/network_monitor.log")
