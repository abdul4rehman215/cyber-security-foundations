#!/usr/bin/env python3
from Registry import Registry
import json
import sys

def extract_registry_key(reg_file, key_path, output_file):
    reg = Registry.Registry(reg_file)
    key = reg.open(key_path)

    data = {
        "key": key_path,
        "subkeys": [],
        "values": []
    }

    for sub in key.subkeys():
        data["subkeys"].append({
            "name": sub.name(),
            "timestamp": sub.timestamp().isoformat()
        })

    for val in key.values():
        data["values"].append({
            "name": val.name(),
            "type": str(val.value_type()),
            "data": str(val.value())
        })

    with open(output_file, "w") as f:
        json.dump(data, f, indent=2)

    return data

def extract_system_info(system_hive):
    reg = Registry.Registry(system_hive)
    info = {}

    select = reg.open("Select")
    current = select.value("Current").value()
    ccs = f"ControlSet00{current}"

    info["current_control_set"] = ccs
    info["computer_name"] = reg.open(f"{ccs}\\Control\\ComputerName\\ComputerName").value("ComputerName").value()

    services = []
    svc_root = reg.open(f"{ccs}\\Services")
    for svc in svc_root.subkeys():
        services.append({
            "name": svc.name(),
            "last_write": svc.timestamp().isoformat()
        })

    info["services"] = services
    return info

def extract_software_info(software_hive):
    reg = Registry.Registry(software_hive)
    apps = []

    uninstall = reg.open("Microsoft\\Windows\\CurrentVersion\\Uninstall")
    for app in uninstall.subkeys():
        app_data = {}
        for val in app.values():
            app_data[val.name()] = str(val.value())
        if app_data:
            apps.append(app_data)

    return apps

if __name__ == "__main__":
    reg_file = sys.argv[1]

    if "SYSTEM" in reg_file.upper():
        data = extract_system_info(reg_file)
        with open("system_registry.json", "w") as f:
            json.dump(data, f, indent=2)

    elif "SOFTWARE" in reg_file.upper():
        data = extract_software_info(reg_file)
        with open("software_registry.json", "w") as f:
            json.dump(data, f, indent=2)
