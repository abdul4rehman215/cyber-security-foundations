# 🛠️ Troubleshooting – Lab 11

## UFW Not Starting
sudo systemctl status ufw
sudo systemctl restart ufw
sudo systemctl enable ufw

## SSH Connection Issues
sudo sshd -t
sudo cp /etc/ssh/sshd_config.backup /etc/ssh/sshd_config
sudo systemctl restart sshd

## Log Access Issues
ls -la /var/log/
sudo mkdir -p /var/log
sudo chmod 755 /var/log
