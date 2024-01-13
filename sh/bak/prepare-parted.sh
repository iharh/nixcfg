#!/usr/bin/env bash
set -eo pipefail # -euo

if [ -z "$1" ]
then
    echo "usage: $0 <device>"
    exit 1
fi

DEVICE=/dev/$1
DEVICE1=${DEVICE}1
DEVICE2=${DEVICE}2

# sudo umount -q $DEVICE2
# sudo umount -q $DEVICE1
#
sudo parted -s -a opt $DEVICE mklabel gpt \
    mkpart primary 512MB 100% \
    mkpart ESP fat32 1MB 512MB \
    set 2 esp on p
#
sudo mkfs.ext4 -L nixos $DEVICE1
sudo mkfs.fat -F 32 -n boot $DEVICE2
#
sudo mount /dev/disk/by-label/nixos /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/disk/by-label/boot /mnt/boot
#
sudo nixos-generate-config --root /mnt
#
sudo mkdir -p /mnt/data
sudo chown nixos:users /mnt/data
#
lsblk
