lshw -short | awk '{for(i=3;i<=NF;++i)printf $i""FS; print ""}' 
lshw -C cpu
lspci | grep -i vga


https://opensource.com/article/19/9/linux-commands-hardware-information
