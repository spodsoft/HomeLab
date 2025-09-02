#!/bin/bash

me=`whoami`

#---------------------------------------------------------

askYesNo() {
  local prompt=$1
  choice=0
  while [[ $choice != "y" ]]  && [[ $choice != "n" ]]; do
    echo -n "$prompt "
    read choice
  done 

  if [[ $choice = "y" ]]; then
    true
  else
    false
  fi
}

installPackage() {
  local packagename=$1
  isInstalled=`dpkg-query -s $packagename | grep "Status: install ok installed"`

  echo -n "-> $packagename ... "
  if [[ ! isInstalled ]]; then
    echo "Installing"
    apt-get install $packagename
  else
    echo "Ok"
  fi
}


#---------------------------------------------------------

bashrcFile=".bashrc"
bashrcUpdated=`grep "bash_start" $bashrcFile`

if [[ $bashrcUpdated ]]; then
  echo "Bashrc already updated"
else
  echo -n "Updating $bashrcFile ..."
  echo '' >> $bashrcFile
  echo '. ~/.bash_start' >> $bashrcFile
  echo '' >> $bashrcFile
  echo "Done."
fi

#---------------------------------------------------------

startFile=".bash_start"

if [ ! -e $startFile ]; then
  echo -n "Creating $startFile ..."
  touch $startFile
  echo '#!/bin/bash ' >> $startFile
  echo '' >> $startFile
  echo '' >> $startFile
  echo "Done."
fi

#---------------------------------------------------------

aliasesFile=".bash_aliases"

if [ ! -e $aliasesFile ]; then
  echo -n "Creating $aliasesFile ..."
  touch $aliasesFile
  echo '# Aliases ' >> $aliasesFile
  echo 'alias h=history' >> $aliasesFile
  echo 'alias cls=clear' >> $aliasesFile
  echo 'alias l="ls -lsa"' >> $aliasesFile
  echo 'alias lt="ls -lsat"' >> $aliasesFile
  echo 'alias dc="sudo docker compose"' >> $aliasesFile
  echo '' >> $aliasesFile
  echo "Done."
fi

#---------------------------------------------------------

echo ""
echo "Updating Package Lists ..."
#apt-get update 
echo ""

echo "Upgrading Packages ..."
#apt-get upgrade -y
echo ""

#---------------------------------------------------------

echo ""
echo "Installing useful packages ..."

installPackage curl
installPackage ca-certificates
installPackage neofetch

echo ""

#---------------------------------------------------------

if askYesNo "Install QEMU GUEST AGENT?"; then

  echo "Installing ..."
  apt -y install qemu-guest-agent
  systemctl enable qemu-guest-agent
  systemctl start qemu-guest-agent
  systemctl status qemu-guest-agent
  echo ""
fi

#---------------------------------------------------------

dockerDir="/docker"

if askYesNo "Install DOCKER?"; then

  echo "Installing ..."
  install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  chmod a+r /etc/apt/keyrings/docker.asc

  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null

  apt-get update
  apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  echo ""

  if [ ! -d $dockerDir ]; then
    mkdir $dockerDir
    mkdir $dockerDir/compose
    mkdir $dockerDir/volumes
    mkdir $dockerDir/build
    touch $dockerDir/.env
    echo "DOCKER_DIR=/docker"             >> $dockerDir/.env
    echo "DOCKER_VOL_DIR=/docker/volumes" >> $dockerDir/.env
    echo "TZ="Europe/London""             >> $dockerDir/.env
    echo "PUID=1000"                      >> $dockerDir/.env
    echo "PGID=1000"                      >> $dockerDir/.env

    chown -R $me $dockerDir
  fi
fi

#---------------------------------------------------------
echo ""
echo "Complete."
echo ""
