#!/usr/bin/env bash
set -eo pipefail # -euo

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

lsblk
