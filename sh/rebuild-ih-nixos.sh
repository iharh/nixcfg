#!/usr/bin/env bash
# --show-trace
sudo nixos-rebuild switch --flake '.#ih-nixos' $*
