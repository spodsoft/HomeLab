# Bind Mount Points

- [Source](https://pve.proxmox.com/wiki/Unprivileged_LXC_containers)

## LXC Config

held in /etc/pvd/lxc/1234.comf

Add mount point

>mp0: /mnt/bindmounts/shared,mp=/shared 

First, we have to change the container UID mapping in the file /etc/pve/lxc/1234.conf

>uid map: from uid 0 map 1005 uids (in the ct) to the range starting 100000 (on the host), so 0..1004 (ct) → 100000..101004 (host) 
>lxc.idmap = u 0 100000 1005 
>lxc.idmap = g 0 100000 1005 

>we map 1 uid starting from uid 1005 onto 1005, so 1005 → 1005 
>lxc.idmap = u 1005 1005 1 
>lxc.idmap = g 1005 1005 1 

>we map the rest of 65535 from 1006 upto 101006, so 1006..65535 → 101006..165535 
>lxc.idmap = u 1006 101006 64530 
>lxc.idmap = g 1006 101006 64530 

File and map for user and group id in both
/etc/subuid 
/etc/subgid 

> root:1005:1 

As a final step, remember to change to owner of the bind mount point directory on the host, to match the uid and gid that were made accessible to the container:
chown -R 1005:1005 /mnt/bindmounts/shared


——


## Mount Command 
mount -t exfat -o uid=1005,gid=1005 /dev/sdX1 /mnt/usb 

fstab path 
/etc/fstab 

fstab command 

/dev/sdX1 /mnt/usb exfat uid=1005,gid=1005 0 1

/mnt/pve/Storage
/etc/pve/local/qemu-server