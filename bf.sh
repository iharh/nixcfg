#! /usr/bin/env bash
nixos-rebuild -I nixos-config=/data/nixcfg/configuration.nix --flake . $@ 
# nixos-rebuild -I nixos-config=/data/nixcfg/configuration.nix --flake '.#ihvbox' $@ 
