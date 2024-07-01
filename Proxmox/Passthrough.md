# GPU Passthrough

[Ultimate Beginner's Guide to GPU Passthrough](https://www.reddit.com/r/homelab/comments/b5xpua/the_ultimate_beginners_guide_to_gpu_passthrough/)


Edit /etc/default/grub

Replace	GRUB_CMDLINE_LINUX_DEFAULT="quiet"
With	GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on"

`update-grub`

Edit /etc/modules 
Add
- vfio
- vfio_iommu_type1
- vfio_pci
- vfio_virqfd

```
echo "options vfio_iommu_type1 allow_unsafe_interrupts=1" > /etc/modprobe.d/iommu_unsafe_interrupts.conf
echo "options kvm ignore_msrs=1" > /etc/modprobe.d/kvm.conf
echo "blacklist radeon" >> /etc/modprobe.d/blacklist.conf
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
echo "blacklist nvidia" >> /etc/modprobe.d/blacklist.conf

lspci -v
```

Find gpu Id, eg. 00:02

`lspci -n -s 00:02`

`echo "options vfio-pci ids=8086:5912 disable_vga=1"> /etc/modprobe.d/vfio.conf`

`update-initramfs -u`
