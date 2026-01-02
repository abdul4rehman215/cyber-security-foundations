#!/bin/bash

# Create working directory
mkdir -p ~/crypto_lab
cd ~/crypto_lab

# Install crypto dependency
pip3 install --user cryptography

# Run hash calculator
python3 scripts/hash_calculator.py data/testfile.txt

# Integrity checker
python3 scripts/integrity_checker.py add data/testfile.txt
python3 scripts/integrity_checker.py verify data/testfile.txt

# Text encryption
python3 scripts/text_encryptor.py

# File encryption
python3 scripts/file_encryptor.py encrypt data/secret.txt data/secret.enc
python3 scripts/file_encryptor.py decrypt data/secret.enc data/recovered.txt
