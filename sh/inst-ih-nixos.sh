#!/usr/bin/env bash
# sudo mkdir /mnt
sudo nixos-install -v --show-trace --no-root-passwd --flake .#ih-nixos
