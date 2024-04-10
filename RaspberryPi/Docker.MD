# Docker 

## Install Docker

```
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update  
sudo apt-get install docker-ce docker-ce-cli containerd.io  
sudo usermod -aG docker ubuntu  
```

##  Validate 
docker run hello-world  

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