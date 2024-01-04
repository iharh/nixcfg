#!/usr/bin/env bash
NIXOS_ISO=`find $HOME/Downloads/dist/nixos -name "nixos-*.iso"`

# --autoconsole
# --noautoconsole
# --boot=cdrom
# --boot=uefi
#  -d, --debug ~/.cache/virt-manager/virt-install.log

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
  --boot=cdrom,hd \
  --noautoconsole
