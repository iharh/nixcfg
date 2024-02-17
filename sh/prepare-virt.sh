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
# --noreboot
# --install no_install=yes \
#
#  --virt-type kvm \
# virsh define
# https://unix.stackexchange.com/questions/716469/virt-install-virsh-create-tries-to-launch-vm-after-install
#
# --noautoconsole
#
# --print-xml
# --dry-run
#
# sudo ls -la /var/lib/libvirt/images
#
# virsh --connect qemu:///system start nixos
#
# --init /bin/sh
#
# man ... --install ... alias
#
# qemu-system-x86_64 \
#   -device virtio-vga-gl \
#   -display gtk,gl=on \
#   -display sdl,gl=on,show-cursor=off \
#   -audio pa,model=hda
#   
# /usr/share/virt-manager/virtinst/cli.py
#   --qemu-commandline='-display gtk,gl=on'
#   --qemu-commandline='-display gtk,gl=off' \
#???
#   -M q35
#   -enable-kvm
#   -smp cores=2,threads=2
#   -boot menu=on
#   -bios /usr/share/edk2/x64/OVMF_CODE.fd
#   -vga virtio
#   -display sdl,gl=on
#   -device intel-hda
#   -device hda-duplex
#
# sudo usermod -a -G kvm <usr>
# https://stackoverflow.com/questions/74893657/how-to-use-graphics-sdl-with-qemu
#
# --qemu-commandline='-device virtio-vga-gl -display gtk,gl=on -audio pa,model=hda' \
# apt/qemu-system-gui package
# https://wiki.archlinux.org/title/QEMU/Guest_graphics_acceleration
# https://blog.tmm.cx/2020/05/15/passing-an-intel-gpu-to-a-linux-kvm-virtual-machine/

virt-install -v \
  --name=nixos \
  --connect qemu:///system \
  --os-variant nixos-unstable \
  --cdrom $NIXOS_ISO \
  --hvm \
  --memory=16392 \
  --vcpus=4 \
  --machine q35 \
  --network bridge=virbr0,model=virtio \
  --disk /var/lib/libvirt/images/nixos.qcow2,size=50,bus=virtio \
  --graphics vnc \
  --console pty,target_type=virtio \
  --qemu-commandline='-display sdl,gl=on' \
  --boot=cdrom,menu=on \
  --noreboot

#  --print-xml
