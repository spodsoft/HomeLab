[# Enable ssh on SD Card 
touch /ssh 

# Enable Wifi
vi /etc/wpa_supplicant/wpa_supplicant.conf 

  	country=GB 
  	ctrl_interface=/var/run/wpa_supplicant 
  	GROUP=netdev 
  	update_config=1

	network={ 
	  scan_ssid=1 
	  ssid="your_wifi_ssid" 
      psk="your_wifi_password" 
  	} 

# Post Install: 

## Ubuntu Enable SSH 
sudo apt update   
sudo apt upgrade   
sudo apt install openssh-server   
sudo service ssh enable   
sudo service ssh start   

## Enable desktop   
sudo apt install xubuntu-desktop   
sudo apt install lubuntu-desktop   
sudo apt install kubuntu-desktop   
sudo apt install ubuntu-desktop  

# Docker 
curl -fsSL https://get.docker.com -o get-docker.sh

 sudo sh get-docker.sh
# Pre Reqs
sudo apt-get install apt-transport-https ca-certificates curl

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb \[arch=arm64\] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update  
sudo apt-get install docker-ce docker-ce-cli containerd.io  
sudo usermod -aG docker ubuntu  

CHANNEL="stable"
DOWNLOAD_URL="https://download.docker.com"
lsb_dist="ubuntu"
dist_version="mantic"

apt_repo="deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] $DOWNLOAD_URL/linux/$lsb_dist $dist_version $CHANNEL"

install -m 0755 -d /etc/apt/keyrings
curl -fsSL \"$DOWNLOAD_URL/linux/$lsb_dist/gpg\" | gpg --dearmor --yes -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo \"$apt_repo\" > /etc/apt/sources.list.d/docker.list


##  Validate 
docker run hello-world  

# Docker Compose 
sudo apt-get install -y libffi-dev libssl-dev  
sudo apt-get install -y python3 python3-pip  
sudo apt-get remove python-configparser  
sudo pip3 install docker-compose  

sudo chmod +x /usr/local/bin/docker-compose  

docker-compose --version  

#  Net tools 
sudo apt install net-tools  

#  EEPROM & Bootloader
sudo apt install rpi-eeprom -y  

To view the current EEPROM configuration:  
rpi-eeprom-config  

To edit it and apply the updates to latest EEPROM release:  
sudo -E rpi-eeprom-config --edit    

https://gitee.com/jikexianfeng/documentation/blob/master/hardware/raspberrypi/bcm2711_bootloader_config.md


##  EEPROM Bootloader
Edited the rpi-eeprom-update file and changed the "critical" value for the FIRMWARE_RELEASE_STATUS option to "stable", using  
sudo nano /etc/default/rpi-eeprom-update. 

Run the command to update the EEPROM:  
sudo rpi-eeprom-update -d -f /lib/firmware/raspberrypi/bootloader/stable/pieeprom-2020-07-16.bin 

Reboot the Pi and check the bootloader version by opening Terminal and running:   
vcgencmd bootloader_version   

This should output something like:  
vcgencmd bootloader_version Jul 16 2020 16:15:46 version 45291ce619884192a6622bef8948fb5151c2b456 (release) timestamp 1594912546   


#  CLone a booted disk
git clone https://github.com/billw2/rpi-clone.git  
cd rpi-clone  
sudo cp rpi-clone /usr/local/sbin/sys-clone   
sudo cp rpi-clone-setup /usr/local/sbin/sys-clone-setup  

## Test  
sudo rpi-clone-setup -t testhostname

## Clone to sdb  
sudo rpi-clone sdb

#  Useful

## vcgencmd
vcgencmd commands - list of commands  
vcgencmd measure_temp - measures temp

## htop
Monitor system resources  
sudo apt install htop](config.MD)
