#!/usr/bin/env bash
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
  --cdrom ~/Downloads/dist/nixos-plasma5-23.05pre451105.06999209d7a-x86_64-linux.iso \
  --disk /var/lib/libvirt/images/nixos.qcow2,size=50,bus=virtio
