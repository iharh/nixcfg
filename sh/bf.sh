#! /usr/bin/env bash
run_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
nixos-rebuild --flake $run_dir $@ 
# --flake '.#ihvbox'
