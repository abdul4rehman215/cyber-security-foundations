#!/bin/bash

# Verify Git installation
git --version

# Configure Git identity
git config --global user.name "Abdul Rehman"
git config --global user.email "abdul.rehman@student.example"

# Verify configuration
git config --list

# Initialize repository
mkdir my-first-repo
cd my-first-repo
git init

# Create files
echo "# My First Git Project" > README.md
echo "This is a sample project to learn Git basics." >> README.md

# Check status
git status

# Stage and commit
git add .
git commit -m "Initial commit: Add README and hello world program"

# Branch operations
git checkout -b feature-improvements
git checkout main
git merge feature-improvements
git branch -d feature-improvements

# Clone repository
cd ~
git clone --bare my-first-repo my-first-repo.git
git clone my-first-repo.git cloned-repo

# Tagging
git tag -a v1.0 -m "First stable version"
