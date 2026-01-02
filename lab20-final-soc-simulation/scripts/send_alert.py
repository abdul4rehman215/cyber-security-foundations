#!/usr/bin/env python3
import sys, json
from datetime import datetime

alert = {
  "timestamp": datetime.now().isoformat(),
  "type": sys.argv[1],
  "message": sys.argv[2]
}

with open("/opt/soc/alerts/all_alerts.log","a") as f:
    f.write(json.dumps(alert)+"\n")
