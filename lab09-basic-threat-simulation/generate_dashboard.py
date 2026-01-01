import json, glob

latest = sorted(glob.glob("threat_analysis_*.json"))[-1]

with open(latest) as f:
    data = json.load(f)

html = "<h1>Threat Simulation Dashboard</h1>"
html += "<h2>Open Ports</h2><ul>"

for p in data["open_ports"]:
    html += f"<li>{p['port']} - {p['service']}</li>"

html += "</ul>"

with open("threat_dashboard.html", "w") as f:
    f.write(html)

print(f"HTML dashboard generated from {latest}")
