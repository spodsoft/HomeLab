Test
#/bin/bash

DATE=$(date +%H-%M-%S)
BACKUP=db-$DATE.sql

DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5

mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP && \
export AWS_ACCESS_KEY_ID=AKIAJRWZWY3CPV3F3JPQ && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
echo "Uploading your $BACKUP backup" && \
aws s3 cp /tmp/db-$DATE.sql s3://$BUCKET_NAME/$BACKUP


 https://pimylifeup.com/raspberry-pi-diyhue/

# Ansible
hosts file

[all:vars]

ansible_connection = ssh

[test]

test1 ansible_host=remote_host ansible_user=remote_user ansible_private_key_file=/var/jenkins_home/ansible/remote-key
web1 ansible_host=web ansible_user=remote_user ansible_private_key_file=/var/jenkins_home/ansible/remote-key
 



curl -fsSL https://get.casaos.io | sudo bash


#--------- Added to signal a required reboot on login ------
rbfile="/var/run/reboot-required"
if [ -e $rbfile ]; then
  echo "Notice: reboot required!"
fi

PS1='\w-> '

cat /etc/os-release | grep PRETTY
cat /sys/firmware/devicetree/base/model
cat /proc/cpuinfo | grep Model | cut -f3 | cut -c3-
uname -v
vcgencmd measure_temp
uptime
echo "----------------------------------------------------------------"
echo ""


  
Wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh

curl -fsSL https://ollama.com/install.sh | sh

Setenv OLLAMA_HOST=0.0.0.0:11434

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


sudo systemctl start docker
sudo systemctl enable docker

sudo systemctl status docker



# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin



	•	sudo nano /etc/wpa_supplicant/wpa_supplicant.conf.
	•	network={ ssid="The SSID of your network (eg. Network name)" psk="Your Wifi Password" }
	•	sudo ifdown wlan0.
	•	sudo ifup wlan0.
	•	ifconfig.
	•	sudo nano /etc/dhcpcd.conf.
	•	sudo reboot.
	•	hostname -I.


Hciconfig
sudo systemctl stop bluetooth


vi /boot/firmware/cmdline.txt 
/boot/firmware//config.txt

 vcgencmd measure_temp
vcgencmd bootloader_config

smartctl -all /dev/nvme0##


smartctl -a /dev/nvme0n1p2

lsb_release
lsb_release --codename
dpkg --print-architecture


For most Linux distributions, the guest agent is available. The package is usually named qemu-guest-agent.
For Windows, it can be installed from the Fedora VirtIO driver ISO.

