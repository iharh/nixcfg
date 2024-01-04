#!/usr/bin/env bash
NIXOS_ISO=`find $HOME/Downloads/dist/nixos -name "nixos-*.iso"`

# virt-install --osinfo list
# nixos-23.11
#
# --autoconsole
# --noautoconsole
# --boot=cdrom
# --boot=uefi
#  -d, --debug ~/.cache/virt-manager/virt-install.log
# --disk /path/to/my-nixos-disk-image.qcow2,device=disk,bus=virtio,size=16 \
# --cdrom=/path/to/latest-nixos-minimal-x86_64-linux.iso \
# https://github.com/sej7278/virt-installs/blob/master/debian10.sh
# ! spice
# https://jihuni.github.io/jekyll/update/2016/10/07/using-libvird-as-non-root-user.html
# https://unix.stackexchange.com/questions/671966/booting-from-real-uefi-disk-image-on-qemu
# --machine type=q35,accel=kvm \
# https://linux.die.net/man/1/virt-install
# https://github.com/libvirt/libvirt/blob/master/tests/qemuxml2argvdata/boot-menu-enable-with-timeout.xml
# virt-install --boot uefi --machine q35 --name focal --memory 1024 --vcpus 1 --disk none --print-xml | grep OVMF
# --reinstall <domain>
# --no-boot
# --install no_install=yes \
#
# virsh define
# https://unix.stackexchange.com/questions/716469/virt-install-virsh-create-tries-to-launch-vm-after-install
#
# --connect qemu:///system \
# --noautoconsole

virt-install -v \
  --name=nixos \
  --os-variant nixos-unstable \
  --cdrom $NIXOS_ISO \
  --hvm
  --virt-type kvm \
  --memory=16392 \
  --vcpus=4 \
  --network bridge=virbr0,model=virtio \
  --disk /var/lib/libvirt/images/nixos.qcow2,size=50,bus=virtio \
  --graphics vnc \
  --console pty,target_type=virtio \
  --machine q35 \
  --boot=cdrom,hd,menu=on \
  --print-xml
