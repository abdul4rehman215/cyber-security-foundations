# 🛠 Troubleshooting – Lab 14

## cryptography Import Error
pip3 install --user cryptography

## Permission Denied
chmod 644 filename
ls -la

## Decryption Failure
- Verify correct password
- Ensure salt + IV extraction
- Ensure encrypted file not corrupted

## JSON Decode Errors
rm integrity.json
Recreate baseline
