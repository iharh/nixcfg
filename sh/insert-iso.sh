#!/usr/bin/env bash
NIXOS_ISO=`find $HOME/Downloads/dist/nixos -name "nixos-*.iso"`
# --source $NIXOS_ISO \
virsh change-media \
  --domain nixos \
  --path $NIXOS_ISO \
  --insert \
  --config
