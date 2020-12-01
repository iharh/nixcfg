#! /usr/bin/env bash
run_dir=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
HOME_MANAGER_CONFIG=$run_dir/hm/iharh.nix home-manager $@ 
# /run/current-system/sw/bin/home-manager
# home-manager -f ./iharh.nix $@ 
