# 📘 Interview Q&A – Lab 06: Port Scanning & Enumeration

Q1. What is the purpose of port scanning in cybersecurity?  
A. It identifies open ports and services to understand the attack surface.

Q2. Why was 127.0.0.1 used as the scan target?  
A. It refers to the local machine and is safe for practice and testing.

Q3. What does nmap -sV do?  
A. It detects service versions running on open ports.

Q4. What information did the Nmap scan reveal in this lab?  
A. Only SSH on port 22 was open and listening.

Q5. What is the difference between netstat -tuln and ss -tuln?  
A. Both list listening services, but ss is faster and more modern.

Q6. Why is nmap -p- useful during enumeration?  
A. It scans all 65,535 TCP ports instead of a limited range.

Q7. What is banner grabbing and why is it important?  
A. It collects service information like software versions for analysis.

Q8. How was Netcat used to validate Nmap results?  
A. By manually connecting to open ports to confirm service availability.

Q9. Why are Nmap scripts used in security assessments?  
A. They automate vulnerability checks and service discovery.

Q10. Why is authorization important before port scanning?  
A. Unauthorized scanning is illegal and unethical.
