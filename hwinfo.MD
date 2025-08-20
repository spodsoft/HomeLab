lshw -short | awk '{for(i=3;i<=NF;++i)printf $i""FS; print ""}' 
lshw -C cpu
lspci | grep -i vga


https://opensource.com/article/19/9/linux-commands-hardware-information


 .bash_start

#!/bin/bash
echo "----------------------------------------------------------------"
echo ""
neofetch

#cat /etc/os-release | grep PRETTY
#cat /sys/firmware/devicetree/base/model
#cat /proc/cpuinfo | grep Model | cut -f3 | cut -c3-
#uname -v
vcgencmd measure_temp
#uptime

wlan=`ifconfig | grep "wlan0" -A 1 | tail -1 | awk '{print $2}'`
eth=`ifconfig | grep "eth0" -A 1 | tail -1 | awk '{print $2}'`
echo " wlan0 $wlan"
echo " eth0  $eth"
echo "----------------------------------------------------------------"
echo ""

.bash_aliases 

alias h=history
alias cls=clear
alias l="ls -lsa"
alias lt="ls -lsat"
alias dc="sudo docker compose"


.bashrc
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

. ~/.bash_start
