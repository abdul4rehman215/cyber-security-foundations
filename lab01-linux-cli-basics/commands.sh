#!/bin/bash
# Lab 01: Linux Command-Line Basics

pwd
ls
ls -l
ls -la

cd /
ls
cd /home
cd ~

mkdir lab_practice
cd lab_practice
touch test_file.txt file1.txt file2.txt file3.txt
mkdir documents

echo "This is my first Linux file" > test_file.txt
echo "This is line 2" >> test_file.txt
cat test_file.txt

cp test_file.txt test_file_backup.txt
cp file1.txt documents/
cp file2.txt file3.txt documents/
cp test_file.txt documents/renamed_file.txt

mkdir backup_folder
mv test_file_backup.txt backup_folder/
mv file2.txt important_file.txt

rm important_file.txt
rm -r backup_folder

echo "#!/bin/bash" > my_script.sh
echo "echo 'Hello from my script!'" >> my_script.sh
chmod +x my_script.sh
./my_script.sh
