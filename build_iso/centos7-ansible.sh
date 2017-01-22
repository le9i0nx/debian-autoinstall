#!/bin/sh
# apt install isomd5sum p7zip-full genisoimage

mkdir -p /tmp/centos7
cd /tmp/
CentOS=CentOS-7-x86_64-NetInstall-1611.iso
CentOS_ks=CentOS-7-x86_64-ks.iso

cat > /tmp/7z_iso.list << EOF
EFI/BOOT/BOOTX64.EFI
LiveOS/squashfs.img
isolinux/initrd.img
isolinux/isolinux.bin
isolinux/vmlinuz
isolinux/boot.cat
EOF

[ -f $CentOS ] || wget "http://mirror.yandex.ru/centos/7/isos/x86_64/$CentOS"
[ -f /tmp/centos7/isolinux/boot.cat ] || 7z x -o/tmp/centos7/ /tmp/$CentOS @/tmp/7z_iso.list -y
cat > centos7/isolinux/isolinux.cfg << EOF
prompt 0
timeout 0
default auto

label auto
    kernel vmlinuz
    append initrd=initrd.img asknetwork inst.stage2=hd:LABEL=CentOS inst.ks=http://le9i0nx.github.io/debian-autoinstall/centos/ks-ansible.cfg
EOF

cat > centos7/EFI/BOOT/grub.cfg << EOF
set default="0"
menuentry 'Install CentOS Linux 7 ks' {
    linuxefi /isolinux/vmlinuz asknetwork inst.stage2=hd:LABEL=CentOS inst.ks=http://le9i0nx.github.io/debian-autoinstall/centos/ks-ansible.cfg
    initrdefi /isolinux/initrd.img
}

EOF

genisoimage -r -R -J -T -v -no-emul-boot -boot-load-size 4 -boot-info-table -V "CentOS" -p "CentOS" -b isolinux/isolinux.bin -c isolinux/boot.cat -o $CentOS_ks centos7/
implantisomd5 $CentOS_ks
