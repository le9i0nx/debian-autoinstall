#!/bin/sh
cd /tmp
mkdir iso
cd iso
wget -O linux -c "http://ftp.debian.org/debian/dists/stable/main/installer-amd64/current/images/netboot/debian-installer/amd64/linux"
wget -O initrd.gz -c "http://ftp.debian.org/debian/dists/stable/main/installer-amd64/current/images/netboot/debian-installer/amd64/initrd.gz"
wget -O isolinux.bin -c "http://mirror.centos.org/centos/7/os/x86_64/isolinux/isolinux.bin"

cat > isolinux.cfg << EOF
prompt 0
timeout 0
default auto

label auto
    kernel /linux
    append auto=true url=http://le9i0nx.github.io/debian-autoinstall/pve.cfg keyboard-configuration/xkb-keymap=en priority=critical vga=788 initrd=/initrd.gz --- quiet
EOF
cd ..
genisoimage -r -V "debian auto install" -cache-inodes -J -l -b isolinux.bin  -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o debian-stable-amd64-auto-install-pve.iso iso/

