#!/bin/sh
mkdir -p /tmp/iso
cd /tmp/iso
[ -f linux ] || wget "http://ftp.debian.org/debian/dists/stable/main/installer-amd64/current/images/netboot/debian-installer/amd64/linux"
[ -f initrd.gz ] || wget "http://ftp.debian.org/debian/dists/stable/main/installer-amd64/current/images/netboot/debian-installer/amd64/initrd.gz"
[ -f initrd.gz.orig ] || cp -p initrd.gz initrd.gz.orig
[ -f firmware.cpio.gz ] || wget "http://cdimage.debian.org/cdimage/unofficial/non-free/firmware/stable/current/firmware.cpio.gz"
cat initrd.gz.orig firmware.cpio.gz > initrd.gz
[ -f isolinux.bin ] || wget "http://mirror.centos.org/centos/7/os/x86_64/isolinux/isolinux.bin"

cat > isolinux.cfg << EOF
prompt 0
timeout 0
default auto

label auto
    kernel /linux
    append auto=true url=http://le9i0nx.github.io/debian-autoinstall/preseed.cfg keyboard-configuration/xkb-keymap=en priority=critical vga=788 initrd=/initrd.gz --- quiet
EOF
cd ..
genisoimage -r -V "debian auto install" -cache-inodes -J -l -b isolinux.bin  -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o debian-stable-amd64-auto-install.iso iso/

