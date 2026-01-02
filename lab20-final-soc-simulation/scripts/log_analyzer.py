#!/usr/bin/env python3
import json
from collections import defaultdict
from datetime import datetime

class SOCAnalyzer:
    def __init__(self):
        self.alerts = []

    def analyze_auth_logs(self, log_file):
        failed = defaultdict(int)
        try:
            with open(log_file) as f:
                for line in f:
                    if "Failed password" in line:
                        ip = line.split()[-4]
                        failed[ip] += 1
        except FileNotFoundError:
            return

        for ip, count in failed.items():
            if count >= 5:
                self.alerts.append({
                    "type": "brute_force",
                    "source_ip": ip,
                    "count": count,
                    "severity": "HIGH"
                })

    def analyze_suricata_logs(self, log_file):
        try:
            with open(log_file) as f:
                for line in f:
                    event = json.loads(line)
                    if event.get("event_type") == "alert":
                        self.alerts.append({
                            "type": "network_alert",
                            "signature": event["alert"]["signature"],
                            "severity": event["alert"]["severity"],
                            "source_ip": event.get("src_ip"),
                            "dest_ip": event.get("dest_ip")
                        })
        except FileNotFoundError:
            pass

    def generate_report(self):
        report = {
            "timestamp": datetime.now().isoformat(),
            "total_alerts": len(self.alerts),
            "alerts": self.alerts
        }
        with open("/opt/soc/reports/analysis_report.json", "w") as f:
            json.dump(report, f, indent=2)
        return report

if __name__ == "__main__":
    analyzer = SOCAnalyzer()
    analyzer.analyze_auth_logs("/opt/soc/logs/auth.log")
    analyzer.analyze_suricata_logs("/opt/soc/logs/suricata-eve.json")
    report = analyzer.generate_report()
    print(f"Analysis complete: {report['total_alerts']} alerts generated")
