#!/usr/bin/env python3
import json
from datetime import datetime
import uuid

class PlaybookTracker:
    def __init__(self):
        self.log = "/opt/soc/logs/playbook_executions.log"

    def start_playbook(self, incident_type, incident_id):
        exec_id = str(uuid.uuid4())
        record = {
            "exec_id": exec_id,
            "incident_type": incident_type,
            "incident_id": incident_id,
            "start_time": datetime.now().isoformat(),
            "steps": []
        }
        with open(self.log,"a") as f:
            f.write(json.dumps(record) + "\n")
        return exec_id

    def log_step(self, exec_id, step, status):
        entry = {
            "exec_id": exec_id,
            "step": step,
            "status": status,
            "time": datetime.now().isoformat()
        }
        with open(self.log,"a") as f:
            f.write(json.dumps(entry) + "\n")

    def complete_playbook(self, exec_id, outcome):
        entry = {
            "exec_id": exec_id,
            "outcome": outcome,
            "completed": datetime.now().isoformat()
        }
        with open(self.log,"a") as f:
            f.write(json.dumps(entry) + "\n")

if __name__ == "__main__":
    tracker = PlaybookTracker()
    eid = tracker.start_playbook("brute_force","INC-001")
    tracker.log_step(eid,"Block IP","completed")
    tracker.complete_playbook(eid,"resolved")
