# BASH

```
#--------- Added to signal a required reboot on login ------ 
rbfile="/var/run/reboot-required" 
if [ -e $rbfile ]; 
then echo "Notice: reboot required!" 
fi

PS1='\w-> '

cat /etc/os-release | grep PRETTY 
cat /sys/firmware/devicetree/base/model 
cat /proc/cpuinfo | grep Model | cut -f3 | cut -c3
uname -v 
vcgencmd measure_temp 
uptime 

echo "----------------------------------------------------------------" 
echo ""
```
