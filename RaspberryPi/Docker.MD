# Docker 

## Pre Reqs

```
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
```

## Installation

```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
````

```
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update  
sudo apt-get install docker-ce docker-ce-cli containerd.io  
sudo usermod -aG docker ubuntu  
```

##  Validate 

`docker run hello-world`

## Docker Compose 

```
sudo apt-get install -y libffi-dev libssl-dev  
sudo apt-get install -y python3 python3-pip  
sudo apt-get remove python-configparser  
sudo pip3 install docker-compose  

sudo chmod +x /usr/local/bin/docker-compose  
```

## Validate

```
docker-compose --version 
``` 