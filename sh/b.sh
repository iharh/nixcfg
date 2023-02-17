#!/usr/bin/env bash
set -eo pipefail # -euo

sudo mount /dev/disk/by-label/nixos /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/disk/by-label/boot /mnt/boot
#
sudo nixos-generate-config --root /mnt
#
sudo mkdir -p /mnt/data
sudo chown nixos:users /mnt/data
