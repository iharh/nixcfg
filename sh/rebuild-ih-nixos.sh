#!/usr/bin/env bash
sudo nixos-rebuild switch --show-trace --flake '.#ih-nixos' $*
