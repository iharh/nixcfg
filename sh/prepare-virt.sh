#!/usr/bin/env bash
NIXOS_ISO=`find $HOME/Downloads/dist/nixos -name "nixos-*.iso"`

echo virt-install -v \
  --name=nixos \
  --connect qemu:///system \
  --virt-type kvm \
  --memory=16392 \
  --vcpus=4 \
  --boot=uefi \
  --network bridge=virbr0,model=virtio \
  --graphics vnc \
  --console pty,target_type=virtio \
  --os-variant nixos-unstable \
  --cdrom $NIXOS_ISO \
  --disk /var/lib/libvirt/images/nixos.qcow2,size=50,bus=virtio
