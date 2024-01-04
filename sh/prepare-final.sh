#!/usr/bin/env bash

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
# --noreboot
# --install no_install=yes \
#
#  --virt-type kvm \
# virsh define
# https://unix.stackexchange.com/questions/716469/virt-install-virsh-create-tries-to-launch-vm-after-install
#
# sudo ls -la /var/lib/libvirt/images
#
# virsh --connect qemu:///system start nixos
#
# --init /bin/sh
#
# man ... --install ... alias

virt-install -v \
  --name=nixos \
  --connect qemu:///system \
  --os-variant nixos-unstable \
  --hvm \
  --memory=16392 \
  --vcpus=4 \
  --machine q35 \
  --network bridge=virbr0,model=virtio \
  --disk /var/lib/libvirt/images/nixos.qcow2,size=50,bus=virtio \
  --graphics vnc \
  --console pty,target_type=virtio \
  --boot uefi,firmware.feature0.name=secure-boot,firmware.feature0.enabled=no \
  --import
