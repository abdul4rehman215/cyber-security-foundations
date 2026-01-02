#!/usr/bin/env python3
"""
Automated Patch Management System
"""
import os
import subprocess
import datetime
import json
import logging

logging.basicConfig(
    filename='/var/log/patch-manager.log',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

class PatchManager:
    def __init__(self):
        self.backup_dir = "/var/backups/patch-manager"
        os.makedirs(self.backup_dir, exist_ok=True)

    def create_system_snapshot(self):
        snapshot = os.path.join(self.backup_dir, datetime.datetime.now().strftime("%Y%m%d_%H%M%S"))
        os.makedirs(snapshot, exist_ok=True)
        subprocess.run(["dpkg", "--get-selections"], stdout=open(f"{snapshot}/packages.txt","w"))
        return snapshot

    def check_available_updates(self):
        subprocess.run(["apt", "update"], stdout=subprocess.DEVNULL)
        upgrades = subprocess.check_output(["apt", "list", "--upgradable"], stderr=subprocess.DEVNULL)
        return upgrades.decode().splitlines()[1:]

    def categorize_updates(self, packages):
        security = [p for p in packages if "security" in p.lower()]
        regular = [p for p in packages if p not in security]
        return {"security": security, "regular": regular}

    def install_security_updates(self):
        subprocess.run(["unattended-upgrades"], stdout=subprocess.DEVNULL)
        return True

    def generate_patch_report(self, updates, snapshot, success):
        report = {
            "timestamp": datetime.datetime.now().isoformat(),
            "snapshot": snapshot,
            "updates": updates,
            "success": success
        }
        with open("/tmp/patch_report.json","w") as f:
            json.dump(report,f,indent=2)
        print(json.dumps(report,indent=2))

    def run_patch_cycle(self, security_only=False):
        snapshot = self.create_system_snapshot()
        updates = self.check_available_updates()
        categorized = self.categorize_updates(updates)
        success = self.install_security_updates() if security_only else False
        self.generate_patch_report(categorized, snapshot, success)

def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--security-only", action="store_true")
    args = parser.parse_args()

    manager = PatchManager()
    manager.run_patch_cycle(security_only=args.security_only)

if __name__ == "__main__":
    main()
