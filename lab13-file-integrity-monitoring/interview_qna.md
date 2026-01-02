# 📘 Interview Q&A – Lab 13: File Integrity Monitoring

Q1. What is File Integrity Monitoring (FIM)?
A. Detects unauthorized file and directory changes.

Q2. Why use auditd?
A. Kernel-level auditing for file access.

Q3. Purpose of auditctl -w?
A. Watch files or directories for changes.

Q4. Why monitor /etc/passwd and /etc/shadow?
A. They store critical authentication data.

Q5. What do ausearch and aureport do?
A. Analyze and summarize audit logs.

Q6. Why checksum-based monitoring?
A. Detect content changes using hashes.

Q7. Limitation of MD5-based FIM?
A. Not real-time; detects changes during scans.

Q8. How does inotify help?
A. Real-time monitoring of file events.

Q9. Why monitor /etc and /usr/bin?
A. Changes may indicate compromise or persistence.

Q10. Why run FIM continuously?
A. Ensures ongoing detection and verification.
