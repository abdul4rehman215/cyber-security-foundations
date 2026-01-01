# PowerShell installation and access
sudo apt update
sudo apt install -y powershell

# Launch PowerShell
pwsh

# PowerShell version info
$PSVersionTable

# Help and discovery
Get-Help
Get-Help Get-ChildItem
Get-Command

# File listing
Get-ChildItem
Get-ChildItem -Force
Get-ChildItem -Directory
Get-ChildItem -File
Get-ChildItem -Recurse
Get-ChildItem *.txt
Get-ChildItem -Hidden

# Directory and file creation
New-Item -ItemType Directory -Name "PowerShellLab"
New-Item -ItemType Directory -Name "TestDir1","TestDir2","TestDir3"
New-Item -ItemType Directory -Path "PowerShellLab/SubDir1/SubDir2" -Force
New-Item -ItemType File -Name "sample.txt"
New-Item -ItemType File -Name "greeting.txt" -Value "Hello, PowerShell World!"
New-Item -ItemType File -Name "file1.txt","file2.txt","file3.txt"

# Copy operations
Copy-Item "original.txt" "copy1.txt"
Copy-Item *.txt "SubDir1/"
Copy-Item "SubDir1" "SubDir1_Backup" -Recurse

# Move operations
Move-Item "temp1.txt" "SubDir1/"
Move-Item "temp2.txt" "SubDir1/renamed_temp.txt"
