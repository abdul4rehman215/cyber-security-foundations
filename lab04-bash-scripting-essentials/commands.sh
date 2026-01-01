# Create directories
mkdir ~/scripts ~/test_data
cd ~/test_data

# Create test files
echo "This is document 1" > document1.txt
echo "This is document 2" > document2.txt
echo "Important data here" > important.txt
mkdir subdirectory
echo "Nested file content" > subdirectory/nested.txt

# Run scripts
cd ~/scripts
chmod +x *.sh
./backup_script.sh
./advanced_backup.sh
./file_manager.sh
./scheduled_backup.sh
./cron_monitor.sh

# Verify cron
crontab -l
