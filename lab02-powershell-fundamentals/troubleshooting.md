# 🛠️ Troubleshooting – Lab 02

## Issue: pwsh command not found
**Solution:**  
Install PowerShell Core using:
```bash
sudo apt install powershell
```
## Issue: Script execution blocked

Solution:
Temporarily bypass execution policy:
```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```
## Issue: Scripts not producing output

Solution:
Ensure scripts are executed inside PowerShell (pwsh) and not Bash.
