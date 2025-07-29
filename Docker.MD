sudo apt-get install -y dbus-user-session
sudo apt-get install -y uidmap
  
curl -sSL http://get.docker.com | sh

dockerd-rootless-setuptool.sh install

# Determine if rootless
docker info -f "{{println .SecurityOptions}}" | grep rootless
