#!/bin/bash
echo "=== File Integrity Monitoring Report ==="
echo "Generated on: $(date)"
echo ""

echo "Recent File Access Events:"
sudo ausearch -k file_access -ts today | head -20

echo ""
echo "Password File Changes:"
sudo ausearch -k passwd_changes -ts today

echo ""
echo "Shadow File Changes:"
sudo ausearch -k shadow_changes -ts today

echo ""
echo "File Summary:"
sudo aureport -f | tail -10
