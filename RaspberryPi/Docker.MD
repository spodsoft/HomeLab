# Docker 

## Installation

```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

## Add 'pi' user to the 'docker' group

`sudo usermod -aG docker pi`

## Unmask the Docker service


`sudo systemctl unmask docker`

## Fix permissions for Docker socket

`sudo chmod 666 /var/run/docker.sock`

##  Validate 

`docker run hello-world`

## Docker Compose 

```
sudo apt-get install -y libffi-dev libssl-dev  
sudo apt-get install -y python3 python3-pip  
sudo apt-get remove python-configparser  
sudo apt install docker-compose  
```

## Validate

`docker-compose --version`

## Start Docker service

```
sudo systemctl start docker
sudo systemctl enable docke
sudo systemctl status docker
```


## Add Docker's official GPG key:

```
sudo apt-get update sudo apt-get install ca-certificates curl sudo install -m 0755 -d /etc/apt/keyrings sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc sudo chmod a+r /etc/apt/keyrings/docker.asc
```

## Add the repository to Apt sources:

```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
