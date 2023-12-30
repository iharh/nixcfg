# NixOS Installation

One day I realized, that it would be good to have step-by-step tutorial for installing NixOS.
Of cause, the standard one is a pretty good starting, point:
* [Installing NixOS](https://nixos.org/manual/nixos/unstable/index.html#sec-installation)
* [virt-install](https://max-ko.ru/56-kvm-sozdanie-i-udalenie-vm-s-pomoschju-virsh-i-virt-install.html)

But it lacks a some modern/advanced features, listed below.
So, I decided to start from the ground up and move slowly to the modern state of the art approaches, like:
* [flakes](https://github.com/NixOS/nix/blob/master/src/nix/flake.md)
* modularity
* [flake-parts](https://flake.parts)
* flake-utils and flake-utils-plus ?
* [kvm](https://github.com/iharh/notes/tree/main/devops/virt/kvm)

# Obtaining installation medium

Feel free to skip not-suitable steps to your specific case

## Downloading the latest unstable minimal nixos ISO

TBD: describe

## Burning ISO to a flash

TBD: describe

# Preparing the VM

Feel free to skip this section if you are going to use real hardware.

## Setting up KVM VM

TBD: describe

## Starting up the VM

TBD: describe

# System Preparation

## Preparing disks

In order to execute all preparational steps before installation, execute 
```
sh/prepare-all.sh
```

## Getting help

```
nixos-help
```

## Preparing environment

```
nix-env -iA nixos.gitMinimal nixos.gh
```

## Cloning this configuration repository

```
export GH_TOKEN=...your-own-token...
gh repo clone iharh/nixcfg
cd nixcfg
gh repo sync
```

## Generating hardware description

TODO: fix in order to avoid disks stuff

```
sudo nixos-generate-config --root /mnt
```

# Installation itself

## Dry Run

```
sudo nixos-rebuild dry-build --flake .#ih-nixos
```

## Final Installation

```
sudo nixos-install -v --show-trace --flake .#ih-nixos
sudo nixos-install -v --show-trace --no-root-passwd --flake .#ih-nixos
```
