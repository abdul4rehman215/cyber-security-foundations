#!/usr/bin/env python3
import Evtx.Evtx as evtx
import json
import sys
from datetime import datetime
from collections import Counter

def extract_events(evtx_file, output_file):
    events = []

    with evtx.Evtx(evtx_file) as log:
        for record in log.records():
            xml = record.xml()
            timestamp = record.timestamp()
            event_id = None
            computer = None

            if "<EventID>" in xml:
                event_id = xml.split("<EventID>")[1].split("</EventID>")[0]
            if "<Computer>" in xml:
                computer = xml.split("<Computer>")[1].split("</Computer>")[0]

            events.append({
                "timestamp": timestamp.isoformat() if timestamp else None,
                "event_id": event_id,
                "computer": computer,
                "xml": xml
            })

    with open(output_file, "w") as f:
        json.dump(events, f, indent=2)

    return events

def analyze_events(events):
    print("=== Event Log Analysis ===")
    print(f"Total Events: {len(events)}")

    ids = [e["event_id"] for e in events if e["event_id"]]
    counter = Counter(ids)

    print("Top 10 Event IDs:")
    for eid, count in counter.most_common(10):
        print(f"Event ID {eid}: {count}")

    timestamps = [e["timestamp"] for e in events if e["timestamp"]]
    if timestamps:
        print(f"Time Range: {min(timestamps)} -> {max(timestamps)}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python3 extract_eventlogs.py <input.evtx> <output.json>")
        sys.exit(1)

    events = extract_events(sys.argv[1], sys.argv[2])
    analyze_events(events)
