# Docker 

## Installation

```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
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