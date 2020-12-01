#! /usr/bin/env bash
set -euo pipefail
sudo nix-env -p /nix/var/nix/profiles/system --delete-generations old
nix-collect-garbage -d
# sudo nix-env -p /nix/var/nix/profiles/system --list-generations
CUR_GEN=`ls -1 /boot/loader/entries | cut -c18- | cut -d "." -f 1 | sort -n -r | head -n 1`
echo leave $CUR_GEN generation only [y/n]?
read -r VAR
if [[ $VAR == "y" ]]; then
    sudo bash -c "cd /boot/loader/entries; ls | grep -v nixos-generation-$CUR_GEN | xargs rm"
else
    echo "skip boot /boot/loader/entries gc"
fi
