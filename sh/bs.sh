#! /usr/bin/env bash
run_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
nixos-rebuild -I nixos-config=$run_dir/configuration.nix $@
