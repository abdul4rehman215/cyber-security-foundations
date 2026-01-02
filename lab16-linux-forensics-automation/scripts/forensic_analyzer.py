#!/usr/bin/env python3
import os, json, datetime
from collections import defaultdict

class LinuxForensicAnalyzer:
    def __init__(self, data_dir):
        self.data_dir = data_dir
        self.results = {}
        self.suspicious = []

    def analyze_auth_logs(self):
        path = os.path.join(self.data_dir, "logs", "auth.log")
        failed = defaultdict(int)

        if not os.path.exists(path):
            return

        with open(path) as f:
            for line in f:
                if "Failed password" in line:
                    ip = line.split()[-4]
                    failed[ip] += 1

        for ip, count in failed.items():
            if count > 10:
                self.suspicious.append(f"Brute force suspected from {ip}")

        self.results["authentication"] = dict(failed)

    def analyze_network(self):
        path = os.path.join(self.data_dir, "network", "listening_ports.txt")
        suspicious_ports = ["4444", "5555", "6666", "1234", "31337"]

        with open(path) as f:
            for line in f:
                if any(p in line for p in suspicious_ports):
                    self.suspicious.append(line.strip())

    def generate_report(self):
        report = {
            "timestamp": datetime.datetime.now().isoformat(),
            "findings": self.results,
            "alerts": self.suspicious
        }

        with open("forensic_analysis_report.txt", "w") as f:
            f.write(json.dumps(report, indent=2))

def main():
    base = "/home/forensics"
    collections = sorted([d for d in os.listdir(base) if d.startswith("automated_collection_")])
    if not collections:
        print("No collection found")
        return

    analyzer = LinuxForensicAnalyzer(os.path.join(base, collections[-1]))
    analyzer.analyze_auth_logs()
    analyzer.analyze_network()
    analyzer.generate_report()
    print("Analysis complete")

if __name__ == "__main__":
    main()
