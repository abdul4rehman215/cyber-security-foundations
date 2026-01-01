# 📘 Interview Q&A – Lab 02: Windows PowerShell Fundamentals

Q1. What is PowerShell Core (pwsh)?  
A. PowerShell Core is a cross-platform automation shell and scripting language developed by Microsoft that runs on Linux, macOS, and Windows.

Q2. How did you verify the installed PowerShell version?  
A. By running the `$PSVersionTable` command inside the PowerShell session.

Q3. Which cmdlet is used to list files and directories in PowerShell?  
A. `Get-ChildItem`, which is similar to the `ls` command in Linux.

Q4. What does `Get-ChildItem -Force` do?  
A. It displays all files and directories, including hidden items.

Q5. How do you create files and directories in PowerShell?  
A. Using the `New-Item` cmdlet with `-ItemType File` or `-ItemType Directory`.

Q6. How do you copy files recursively in PowerShell?  
A. By using `Copy-Item` with the `-Recurse` option.

Q7. What is the purpose of the `Move-Item` cmdlet?  
A. It moves or renames files and directories.

Q8. How are variables defined in PowerShell scripts?  
A. By prefixing variable names with the `$` symbol.

Q9. Which loops were used in this lab?  
A. `for`, `foreach`, and `while` loops.

Q10. Why is PowerShell important for cybersecurity tasks?  
A. It enables automation of system inspection, incident response, log analysis, and administrative tasks across multiple platforms.
