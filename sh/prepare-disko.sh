#!/usr/bin/env bash
set -eo pipefail # -euo

#if [ -z "$1" ]
#then
#    echo "usage: $0 <device>"
#    exit 1
#fi

#DEVICE=/dev/$1
#DEVICE1=${DEVICE}1
#DEVICE2=${DEVICE}2

# --mode 
# zap_create_mount == disko
# https://github.com/nix-community/disko/blob/master/cli.nix#L26
# set the mode, either format, mount or disk

#    "nixos/$TARGET_HOST/disks.nix"
sudo nix run github:nix-community/disko \
    --extra-experimental-features "nix-command flakes" \
    --no-write-lock-file \
    -- \
    --mode disko \
    ./disks.nix

# sudo umount -q $DEVICE2
# sudo umount -q $DEVICE1
#
#sudo mount /dev/disk/by-label/nixos /mnt
#sudo mkdir -p /mnt/boot
#sudo mount /dev/disk/by-label/boot /mnt/boot
#
#sudo nixos-generate-config --root /mnt
#
#sudo mkdir -p /mnt/data
#sudo chown nixos:users /mnt/data
#
lsblk
