# Web Application Attack Response Playbook
## Classification
- **Type**: Web Application Exploitation
- **Severity**: Critical
- **MITRE ATT&CK**: T1190
## Detection Indicators
- Suspicious parameters: cmd=, eval(), system()
- SQL injection patterns
- Directory traversal attempts (../)
- Web shell upload attempts
## Response Steps
### Immediate Actions (0-10 min)
1. Verify alert in web server logs
2. Block source IP immediately
3. Check for successful exploitation
4. Isolate affected web server if compromised
### Investigation (10-45 min)
1. Analyze web server access logs
2. Search for uploaded malicious files
3. Check database for unauthorized changes
4. Review application error logs
### Containment (30-120 min)
1. Remove any malicious files found
2. Patch vulnerable application components
3. Update web application firewall rules
4. Reset application credentials
### Recovery (2-8 hours)
1. Restore from clean backup if needed
2. Implement additional security controls
3. Update application to latest version
4. Monitor for reinfection attempts
## Automation Commands
# Block attacking IP
```
/opt/soc/scripts/block_ip.sh <IP_ADDRESS> "web_attack"
```
# Search for web shells
```
find /var/www -name "*.php" -exec grep -l "eval\|system\|exec" {} \;
```
# Analyze web logs
```
grep -E "(cmd=|eval\(|system\()" /var/log/apache2/access.log
```
