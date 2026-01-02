# 📘 Interview Q&A – Lab 15: Basic Incident Response Simulation

Q1. What is the first step in incident response?
A. Identifying Indicators of Compromise (IoCs).

Q2. Why was /tmp/.xminer.py suspicious?
A. It ran from /tmp, used high CPU, and executed as root.

Q3. How was malicious traffic identified?
A. Using netstat and ss to inspect active connections.

Q4. Why is outbound traffic on port 4444 suspicious?
A. Common command-and-control port.

Q5. Why collect evidence before remediation?
A. To preserve forensic integrity.

Q6. Why hash evidence?
A. To detect tampering.

Q7. How was containment achieved?
A. Killing the process and blocking the IP.

Q8. Why analyze logs?
A. To trace attacker behavior.

Q9. Why document incidents?
A. For audits, lessons learned, and compliance.

Q10. Why is this lab SOC-relevant?
A. It simulates real-world IR workflows.
