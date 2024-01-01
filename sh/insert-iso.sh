#!/usr/bin/env bash
NIXOS_ISO=`find $HOME/Downloads/dist/nixos -name "nixos-*.iso"`
vish change-media \
  --domain nixos \
  --path sr0 \
  --source $NIXOS_ISO \
  --insert \
  --config
