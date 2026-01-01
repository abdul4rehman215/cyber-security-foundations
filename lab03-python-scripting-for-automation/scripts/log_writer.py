from datetime import datetime

log_entries = [
    "INFO: User admin logged in successfully",
    "WARNING: Failed login attempt from IP 192.168.1.100",
    "ERROR: Unauthorized access attempt detected",
    "INFO: Firewall rule updated",
    "CRITICAL: Multiple failed login attempts - account locked"
]

with open("../logs/security.log", "w") as log:
    print("Generating security log entries...")
    print("----------------------------------------")
    for entry in log_entries:
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log.write(f"[{timestamp}] {entry}\n")
        print(f"Log entry written: {entry.split(':')[0]}")
    print("----------------------------------------")
    print("All log entries written to ../logs/security.log")
