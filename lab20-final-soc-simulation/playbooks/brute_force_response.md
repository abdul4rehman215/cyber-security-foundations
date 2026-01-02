# Brute Force Attack Response Playbook
## Classification
* **Type**: Brute Force Authentication Attack
* **Severity**: High
* **MITRE ATT&CK**: T1110
## Detection Indicators
* 5+ failed login attempts from single IP within 5 minutes
* Source: /opt/soc/logs/auth.log, Suricata alerts
## Response Steps
### Immediate Actions (0-15 min)
1. Verify alert authenticity in logs
2. Identify source IP address
3. Block IP using: `/opt/soc/scripts/block_ip.sh <IP> "brute_force"`
4. Check for successful logins from same IP
### Investigation (15-60 min)
1. Analyze full authentication log history
2. Identify targeted user accounts
3. Check for lateral movement indicators
4. Review network traffic from source IP
### Containment (30-90 min)
1. Reset passwords for targeted accounts
2. Enable MFA if not already active
3. Update firewall rules
4. Monitor for continued attacks
### Recovery (1-4 hours)
1. Document incident timeline
2. Update detection rules if needed
3. Brief security team
4. Create incident report
## Automation Commands

# Block attacking IP
```
/opt/soc/scripts/block_ip.sh <IP_ADDRESS> "brute_force_attack"
```
# Check blocked IPs
```
sudo iptables -L INPUT -n | grep DROP
```
# Analyze authentication logs
```
grep "Failed password" /opt/soc/logs/auth.log | tail -20
```
# Escalation Criteria
- Multiple source IPs attacking simultaneously
- Successful authentication detected
- Critical system accounts targeted 
