#!/usr/bin/env python3
import random
import datetime
import os

def generate_sample_logs():
    os.makedirs("logs", exist_ok=True)
    logfile = "logs/system.log"

    normal_activities = [
        "User login successful",
        "File access granted",
        "Database query executed",
        "Scheduled backup completed",
        "Service started successfully",
        "Configuration file read",
        "User logged out"
    ]

    suspicious_activities = [
        "Multiple failed login attempts",
        "SQL injection attempt detected",
        "Unauthorized file access attempt",
        "Malware signature detected",
        "Port scanning activity detected",
        "Privilege escalation attempt"
    ]

    users = ["alice", "bob", "charlie", "admin", "service"]
    logs = []

    for _ in range(1000):
        ts = datetime.datetime.now() - datetime.timedelta(minutes=random.randint(1, 1440))
        entry = f"{ts.strftime('%Y-%m-%d %H:%M:%S')} | INFO | 192.168.1.{random.randint(2,254)} | {random.choice(users)} | {random.choice(normal_activities)}"
        logs.append(entry)

    for _ in range(50):
        ts = datetime.datetime.now() - datetime.timedelta(minutes=random.randint(1, 1440))
        entry = f"{ts.strftime('%Y-%m-%d %H:%M:%S')} | WARNING | 10.0.0.{random.randint(2,254)} | {random.choice(users)} | {random.choice(suspicious_activities)}"
        logs.append(entry)

    random.shuffle(logs)

    with open(logfile, "w") as f:
        for line in logs:
            f.write(line + "\n")

    print(f"Generated {len(logs)} log entries in {logfile}")

if __name__ == "__main__":
    generate_sample_logs()
