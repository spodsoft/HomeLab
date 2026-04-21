1. Enable automatic security updates:

sudo apt install unattended-upgrades
# OR
sudo dpkg-reconfigure unattended-upgrades

2. Create a non-root user:

adduser deployer
usermod -aG sudo deployer

# Disable root password login
sudo passwd -l root

3. SSH Auth

Generate a key on your local machine:
bash

ssh-keygen -t ed25519 -C "your-email@example.com"

Copy it to the server:

ssh-copy-id deployer@your-server-ip

ssh-copy-id deployer@your-server-ip
Then update the /etc/ssh/ssd_config:

PermitRootLogin no
PasswordAuthentication no
PermitEmptyPasswords no
MaxAuthTries 3
AllowUsers deployer

Restart SSH:

sudo systemctl restart sshd

4. Firewall

sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable

5. Fail2Ban

sudo apt install fail2ban

sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo nano /etc/fail2ban/jail.local

[sshd]
enabled = true
port = ssh
maxretry = 3
bantime = 3600
findtime = 600

sudo systemctl restart fail2ban
sudo systemctl enable fail2ban

6. Services

See what's listening:
sudo ss -tulpn

sudo systemctl disable cups
sudo systemctl stop cups

