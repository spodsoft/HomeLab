# Wear Checks

## SATA SSD Check

`smartctl -a /dev/sda`

## NVME Check

`smartctl -a /dev/nvme0`

## Install IOStat

```apt install sysstat
iostat -dx 5```

## Recent logging

`journalctl --since "10 minutes ago" --no-pager`

`du -h --max-depth=1 /var/log | sort -h`

### Log usage

```du -sh /var/log
journalctl --disk-usage'```

`sudo journalctl --vacuum-time=2d`

# Log2RAM

