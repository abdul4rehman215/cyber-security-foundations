# 🛠️ Troubleshooting – Lab 08

## Issue 1: Merge Conflicts
Git marks conflicting sections in files.
Resolve manually, then run:
git add <file>
git commit -m "Resolve merge conflict"

## Issue 2: Wrong Files Staged
To unstage files:
git reset HEAD <filename>

## Issue 3: Undo Last Commit (Keep Changes)
git reset --soft HEAD~1

## Issue 4: Check What Will Be Committed
git diff --staged
