#!/bin/bash
REPORT="$HOME/security-lab/logs/security-report-$(date +%Y%m%d-%H%M).html"

cat <<EOF > "$REPORT"
<html>
<head><title>Security Hardening Report</title></head>
<body>
<h1>Security Hardening Report</h1>
<p>Generated: $(date)</p>
<h2>Security Policies</h2>
<pre>$(cat config/security-config.json)</pre>
<h2>Registry Settings</h2>
<pre>$(cat config/registry-security.json)</pre>
<h2>Recent Alerts</h2>
<pre>$(grep -R "ALERT" logs || echo "No alerts")</pre>
</body>
</html>
EOF
