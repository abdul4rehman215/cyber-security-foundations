#!/bin/bash

echo "File Management Script Starting..."
echo "=================================="

mkdir -p txt_files log_files config_files backup_files

touch testfile1.txt app.log config.conf backup.bak

mv *.txt txt_files/
mv *.log log_files/
mv *.conf config_files/
mv *.bak backup_files/

echo "Files organized successfully!"
