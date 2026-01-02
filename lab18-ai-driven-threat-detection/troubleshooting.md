# 🛠 Troubleshooting – Lab 18

## pandas / sklearn Import Error
Install dependencies:
pip3 install pandas numpy scikit-learn

## Log File Not Found
Ensure logs exist:
ls -la logs/system.log

## Real-Time Monitor Not Triggering
- Ensure log file is appended, not overwritten
- Check read permissions

## Poor ML Accuracy
- Increase dataset size
- Improve feature engineering
- Balance normal vs suspicious logs
