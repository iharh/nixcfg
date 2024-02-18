# Prerequisites

Install the following
* ovmf
* qemu-utils
* virt-viewer
* libxapp-dev
* dnsmasq

[fix-permission-error](https://askubuntu.com/questions/722034/permission-error-in-virtual-machine-manager)

```
setfacl -m u:libvirt-qemu:x $HOME
getfacl $HOME
```

# setting up the network bridge

```
sudo virsh net-start default
virsh net-list --all
brctl show
```

# preparing vm

```
sh/nix/prepare-virt.sh
```

# installing from ISO (inside vm)
```
create ~/.config/sops/age/keys.txt

export GH_TOKEN=...your-own-token...
nix-env -iA nixos.ripgrep nixos.nixFlakes nixos.gitMinimal nixos.gh nixos.neovim
gh repo clone iharh/nixcfg
cd nixcfg
gh repo sync
sh/nix/prepare-disko.sh
cat /mnt/etc/nixos/hardware-configuration.nix
cat /mnt/etc/nixos/configuration.nix
sh/nix/inst-nixos.sh
find /mnt/boot
sudo poweroff
```

# correcting vm 
```
virsh undefine nixos --snapshots-metadata --checkpoints-metadata
sh/nix/prepare-final.sh
```

# rebiulding (inside vm)
```
nix-env -iA nixos.ripgrep nixos.nixFlakes nixos.gitMinimal nixos.gh nixos.neovim
create ~/.config/sops/age/keys.txt
export GH_TOKEN=...your-own-token... or 
gh repo clone iharh/nixcfg
cd nixcfg
gh repo sync
sh/ih/rebuild-nixos.sh
```

# Keys

* Ctrl+Alt  Host key at virt-viewer
* C-]       To exit the console, hold the CTRL key and press ], then press Enter.
