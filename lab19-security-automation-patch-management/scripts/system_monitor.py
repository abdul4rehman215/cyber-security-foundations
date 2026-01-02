#!/usr/bin/env python3
"""
System Security Monitor
"""
import os
import subprocess
import datetime
import json
import logging
import psutil

logging.basicConfig(
    filename='/var/log/system-monitor.log',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

class SystemSecurityMonitor:
    def __init__(self):
        self.report = {
            "timestamp": datetime.datetime.now().isoformat(),
            "hostname": os.uname().nodename,
            "checks": {}
        }

    def check_failed_logins(self):
        try:
            result = subprocess.check_output(
                ["grep", "Failed password", "/var/log/auth.log"],
                stderr=subprocess.DEVNULL
            ).decode().splitlines()
            self.report["checks"]["failed_logins"] = len(result)
        except subprocess.CalledProcessError:
            self.report["checks"]["failed_logins"] = 0

    def check_disk_usage(self):
        usage = psutil.disk_usage("/")
        status = "OK"
        if usage.percent > 90:
            status = "CRITICAL"
        elif usage.percent > 80:
            status = "WARNING"

        self.report["checks"]["disk_usage"] = {
            "used_percent": usage.percent,
            "status": status
        }

    def check_system_updates(self):
        subprocess.run(["apt", "update"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        upgrades = subprocess.check_output(["apt", "list", "--upgradable"], stderr=subprocess.DEVNULL)
        count = len(upgrades.decode().splitlines()) - 1
        self.report["checks"]["pending_updates"] = count

    def generate_report(self):
        report_file = f"/tmp/security_report_{datetime.datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
        with open(report_file, "w") as f:
            json.dump(self.report, f, indent=2)

        logging.info("Security report generated")
        print(json.dumps(self.report, indent=2))
        print(f"Report saved to: {report_file}")

    def run_all_checks(self):
        self.check_failed_logins()
        self.check_disk_usage()
        self.check_system_updates()
        self.generate_report()

def main():
    try:
        monitor = SystemSecurityMonitor()
        monitor.run_all_checks()
    except Exception as e:
        logging.error(str(e))
        print("Error:", e)

if __name__ == "__main__":
    main()
