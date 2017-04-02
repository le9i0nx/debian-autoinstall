#!/bin/sh
mkdir -p /tmp/debian
cd /tmp/debian
[ -f initrd.gz ] || wget "http://ftp.debian.org/debian/dists/stable/main/installer-amd64/current/images/netboot/debian-installer/amd64/initrd.gz"
[ -f firmware.cpio.gz ] || wget "http://cdimage.debian.org/cdimage/unofficial/non-free/firmware/stable/current/firmware.cpio.gz"
cat initrd.gz firmware.cpio.gz > /initrd.gz
rm -r /tmp/debian
cd /boot
[ -f linux ] || wget "http://ftp.debian.org/debian/dists/stable/main/installer-amd64/current/images/netboot/debian-installer/amd64/linux"

cat > /boot/grub/grub.cfg << EOF
timeout=1

menuentry 'auto install debian' {
    search --set=root /linux
    linux    /linux auto=true url=http://le9i0nx.github.io/debian-autoinstall/aws.cfg interface=auto netcfg/dhcp_timeout=60 keyboard-configuration/xkb-keymap=en priority=critical vga=788 --- quiet
    initrd   /initrd.gz
}

EOF
