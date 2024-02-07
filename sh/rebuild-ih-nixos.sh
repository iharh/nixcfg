#!/usr/bin/env bash
# --show-trace
# ??? boot
sudo nixos-rebuild switch --flake '.#ih-nixos' $*
