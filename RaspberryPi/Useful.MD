# Useful commands

###  NVME logs

`journalctl -f -g nvme`

### Show Hardware

`lshw`

### Show CPU

`lscpu`

### Show PCI devices

`lspci`


### Show usb devices

`lsusb`

### Change user group

`sudo usermod -aG sudo fred`

### Wifi Status

`wifi-status`

### Sensor

`sensors`

### Power Usage

`powertop`

### Bluetooth

`bluetoothctl`

### Smart 

`smartctl`

`smartctl -all /dev/nvme0##`

`smartctl -a /dev/nvme0n1p2`
