#!/usr/bin/env bash
# sudo mkdir /mnt
# -v
sudo nixos-install --debug --show-trace --no-root-passwd --flake .#ih-nixos
