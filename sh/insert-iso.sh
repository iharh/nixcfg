#!/usr/bin/env bash
NIXOS_ISO=`find $HOME/Downloads/dist/nixos -name "nixos-*.iso"`
virsh change-media \
  --domain nixos \
  --path sda \
  --source $NIXOS_ISO \
  --insert \
  --config
