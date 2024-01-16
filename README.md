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
sh/prepare-virt.sh
```

# installing from ISO (inside vm)
```
export GH_TOKEN=...your-own-token...
nix-env -iA nixos.ripgrep nixos.nixFlakes nixos.gitMinimal nixos.gh nixos.neovim
gh repo clone iharh/nixcfg
cd nixcfg
gh repo sync
sh/prepare-disko.sh
cat /mnt/etc/nixos/hardware-configuration.nix
cat /mnt/etc/nixos/configuration.nix
sh/inst-ih-nixos.sh
find /mnt/boot
sudo poweroff
```

# correcting vm 
```
virsh undefine nixos --snapshots-metadata --checkpoints-metadata
sh/prepare-final.sh
```

# rebiulding (inside vm)
```
export GH_TOKEN=...your-own-token...
nix-env -iA nixos.ripgrep nixos.nixFlakes nixos.gitMinimal nixos.gh nixos.neovim
gh repo clone iharh/nixcfg
cd nixcfg
gh repo sync
sh/rebuild-ih-nixos.sh
```

# Keys

* Ctrl+Alt  Host key at virt-viewer
* C-]       To exit the console, hold the CTRL key and press ], then press Enter.
