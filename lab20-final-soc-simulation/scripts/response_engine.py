#!/usr/bin/env python3
import json, subprocess, time

processed = set()

while True:
    with open("/opt/soc/reports/analysis_report.json") as f:
        report = json.load(f)
        for alert in report["alerts"]:
            key = json.dumps(alert)
            if key not in processed:
                subprocess.run([
                    "/opt/soc/scripts/block_ip.sh",
                    alert["source_ip"],
                    alert["type"]
                ])
                processed.add(key)
    time.sleep(30)
