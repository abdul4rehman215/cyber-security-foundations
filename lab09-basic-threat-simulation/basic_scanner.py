#!/usr/bin/env python3
import nmap
import json
from datetime import datetime

def basic_scan(target, ports="1-1000"):
    nm = nmap.PortScanner()
    print(f"Starting scan of {target} on ports {ports}")
    nm.scan(target, ports, arguments='-sV -sC')
    return nm

def display_results(nm, target):
    print("\nSCAN RESULTS")
    if target in nm.all_hosts():
        host = nm[target]
        for proto in host.all_protocols():
            for port in host[proto]:
                print(f"{port}/{proto} {host[proto][port]['state']} {host[proto][port]['name']}")

def save_results(nm, target):
    data = {
        "timestamp": datetime.now().isoformat(),
        "target": target
    }
    with open("scan_results.json", "w") as f:
        json.dump(data, f, indent=2)

if __name__ == "__main__":
    target = "127.0.0.1"
    nm = basic_scan(target)
    display_results(nm, target)
    save_results(nm, target)
