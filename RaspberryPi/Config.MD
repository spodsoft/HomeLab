# Raspberry Pi Config

## Raspberry Pi 5

> /boot/firmware/config.txt

(https://www.raspberrypi.com/documentation/computers/config_txt.html)

Add to 'all'
```
dtparam=nvme
dtparam=pciex1_gen=2
```
Bootloader config

> rpi-eeprom-config -e

Add to 'all'

```
PSU_MAX_CURRENT=5000
BOOT_UART=1
POWER_OFF_ON_HALT=0
BOOT_ORDER=0xf416
PCIE_PROBE=1
````

---
#  EEPROM & Bootloader

To install tools
`sudo apt install rpi-eeprom -y`  

To view the current EEPROM configuration:  
`rpi-eeprom-config`  

To edit it and apply the updates to latest EEPROM release:  
`sudo -E rpi-eeprom-config --edit`

[EEPROM Values](https://gitee.com/jikexianfeng/documentation/blob/master/hardware/raspberrypi/bcm2711_bootloader_config.md)


##  EEPROM Bootloader
Edited the rpi-eeprom-update file and changed the "critical" value for the FIRMWARE_RELEASE_STATUS option to "stable", using  
`sudo nano /etc/default/rpi-eeprom-update`

Run the command to update the EEPROM:  
`sudo rpi-eeprom-update -d -f /lib/firmware/raspberrypi/bootloader/stable/pieeprom-2020-07-16.bin`

Reboot the Pi and check the bootloader version by opening Terminal and running:   
`vcgencmd bootloader_version`

This should output something like:  
`vcgencmd bootloader_version Jul 16 2020 16:15:46 version 45291ce619884192a6622bef8948fb5151c2b456 (release) timestamp 1594912546``
  