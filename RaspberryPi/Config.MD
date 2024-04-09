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

