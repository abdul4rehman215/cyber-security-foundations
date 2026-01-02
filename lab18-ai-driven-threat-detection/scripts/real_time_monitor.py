#!/usr/bin/env python3
import time
import json
from datetime import datetime

class ThreatMonitor:
    def __init__(self, log_file_path, config_file):
        self.log_file_path = log_file_path
        self.config = self.load_config(config_file)
        self.last_position = 0

    def load_config(self, config_file):
        with open(config_file) as f:
            return json.load(f)

    def check_new_entries(self):
        with open(self.log_file_path) as f:
            f.seek(self.last_position)
            lines = f.readlines()
            self.last_position = f.tell()
            return lines

    def analyze_entry(self, entry):
        for pattern in self.config["threat_patterns"]:
            if pattern.lower() in entry.lower():
                severity = self.config["severity_levels"].get(pattern,"MEDIUM")
                return {
                    "timestamp": datetime.now().isoformat(),
                    "pattern": pattern,
                    "severity": severity,
                    "entry": entry.strip()
                }
        return None

    def send_alert(self, threat):
        msg = f"[{threat['timestamp']}] [{threat['severity']}] {threat['pattern']} | {threat['entry']}"
        print(msg)
        with open(self.config["alert_log_file"], "a") as f:
            f.write(msg + "\n")

    def start_monitoring(self):
        try:
            while True:
                for entry in self.check_new_entries():
                    threat = self.analyze_entry(entry)
                    if threat:
                        self.send_alert(threat)
                time.sleep(self.config["monitoring_interval"])
        except KeyboardInterrupt:
            print("Monitoring stopped.")

def main():
    monitor = ThreatMonitor("../logs/system.log","alert_config.json")
    monitor.start_monitoring()

if __name__ == "__main__":
    main()
