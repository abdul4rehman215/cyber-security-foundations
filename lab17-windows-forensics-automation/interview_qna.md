# 📘 Interview Q&A – Lab 17: Windows Forensics Automation

Q1. What is Windows forensics?
A. The process of collecting and analyzing Windows artefacts such as event logs and registry hives.

Q2. Why analyze EVTX files on Linux?
A. Enables offline, cross-platform investigations without Windows dependencies.

Q3. What are EVTX files?
A. Windows Event Log files recording authentication, services, and system activity.

Q4. Which Event IDs were critical?
A. 4624, 4625, 4672, 7045.

Q5. Why are failed logon events important?
A. They indicate brute-force or credential abuse attempts.

Q6. What does the SYSTEM registry hive reveal?
A. Control sets, services, and computer identity.

Q7. Why analyze SOFTWARE hive?
A. To identify installed applications and persistence mechanisms.

Q8. How did Python help?
A. Automated parsing, analysis, and IOC detection.

Q9. Why use PowerShell Core?
A. To apply Windows-native forensic logic cross-platform.

Q10. Why is this lab SOC-relevant?
A. It mirrors real DFIR workflows and evidence-based investigations.
