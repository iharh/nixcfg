#!/usr/bin/env bash
NIXOS_ISO=`find $HOME/Downloads/dist/nixos -name "nixos-*.iso"`

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

virt-install -v \
  --name=nixos \
  --connect qemu:///system \
  --virt-type kvm \
  --memory=16392 \
  --vcpus=4 \
  --network bridge=virbr0,model=virtio \
  --os-variant nixos-unstable \
  --disk /var/lib/libvirt/images/nixos.qcow2,size=50,bus=virtio \
  --graphics vnc \
  --console pty,target_type=virtio \
  --cdrom $NIXOS_ISO \
  --boot=cdrom,hd,menu=on \
  --noautoconsole
