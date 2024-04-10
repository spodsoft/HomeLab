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



# Docker Compose 
sudo apt-get install -y libffi-dev libssl-dev  
sudo apt-get install -y python3 python3-pip  
sudo apt-get remove python-configparser  
sudo pip3 install docker-compose  

sudo chmod +x /usr/local/bin/docker-compose  

docker-compose --version  

