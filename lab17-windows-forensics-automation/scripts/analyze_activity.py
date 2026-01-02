#!/usr/bin/env python3
import json
import os
from datetime import datetime

class ForensicAnalyzer:
    def __init__(self, data_dir="./forensic_output"):
        self.data_dir = data_dir
        self.anomalies = []

    def load_analysis_files(self):
        data = {}
        for f in os.listdir(self.data_dir):
            if f.endswith("_analysis.json"):
                with open(os.path.join(self.data_dir, f)) as fh:
                    data[f] = json.load(fh)
        return data

    def detect_high_frequency_events(self, data):
        for file, content in data.items():
            for e in content.get("TopEventIDs", []):
                if e["Count"] > 1000:
                    self.anomalies.append({
                        "event": e["Name"],
                        "count": e["Count"],
                        "severity": "High" if e["Count"] > 5000 else "Medium"
                    })

    def generate_ioc_report(self):
        report = {
            "timestamp": datetime.now().isoformat(),
            "total_anomalies": len(self.anomalies),
            "anomalies": self.anomalies,
            "recommendations": [
                "Investigate high-frequency login failures",
                "Review privilege escalation events",
                "Audit new service installations"
            ]
        }

        with open(f"{self.data_dir}/ioc_report.json", "w") as f:
            json.dump(report, f, indent=2)

        return report

def main():
    analyzer = ForensicAnalyzer()
    data = analyzer.load_analysis_files()
    analyzer.detect_high_frequency_events(data)
    analyzer.generate_ioc_report()
    print("IOC analysis complete")

if __name__ == "__main__":
    main()
