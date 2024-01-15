# Prerequisites

Install the following
* ovmf
* qemu-utils
* virt-viewer
* libxapp-dev
* dnsmasq

https://askubuntu.com/questions/722034/permission-error-in-virtual-machine-manager
* setfacl -m u:libvirt-qemu:x $HOME
* getfacl $HOME

setting up the network bridge
* sudo virsh net-start default
* virsh net-list --all
* brctl show

## Keys

* Ctrl+Alt  Host key at virt-viewer
* C-]       To exit the console, hold the CTRL key and press ], then press Enter.

## Preparing environment

Outside of vm
```
sh/prepare-virt.sh
```

Inside vm
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

Then - at the host system
```
virsh undefine nixos --snapshots-metadata --checkpoints-metadata

virsh pool-list # images, nixos
virsh vol-list images # nixos.qcow2
virsh vol-list nixos # nixos-minimal-...iso

sh/prepare-final.sh
```

https://github.com/nix-community/disko/blob/master/docs/HowTo.md#installing-nixos-module
https://github.com/nix-community/disko/blob/master/docs/quickstart.md

virsh vol-delete nixos.qcow2 --pool images

## Inside VM

```
export GH_TOKEN=...your-own-token...
nix-env -iA nixos.ripgrep nixos.nixFlakes nixos.gitMinimal nixos.gh nixos.neovim
gh repo clone iharh/nixcfg
cd nixcfg
gh repo sync
sudo nixos-rebuild switch --flake '.#ih-nixos'
```

# System Preparation

## Preparing disks

https://access.redhat.com/documentation/ru-ru/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-guest_virtual_machine_installation_overview-creating_guests_with_virt_install
    virt-install --option=?
https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/loader/grub/grub.nix
https://nixos.wiki/wiki/Bootloader
https://discourse.nixos.org/t/systemd-boot-keeps-starting-even-if-grub-is-installed/23065

!!!
https://unix.stackexchange.com/questions/671966/booting-from-real-uefi-disk-image-on-qemu
     -machine type=q35,accel=kvm \

https://www.technicalsourcery.net/posts/nixos-in-libvirt/

https://github.com/gabyx/dotfiles/blob/main/nixos/hosts/vm/boot.nix
https://github.com/gabyx/dotfiles/blob/main/nixos/hosts/desktop/boot.nix
https://github.com/gabyx/nixos-configuration/blob/main/configuration-desktop-init.nix
    boot.loader.grub.enable = true;
    boot.loader.grub.version = 2;

systemd
https://github.com/erictossell/nixflakes/blob/main/modules/boot/systemd/default.nix

sh/prepare-virt.sh
https://libvirt.org/formatdomain.html

```
<bootmenu enable='yes' timeout='3000'/>

<os firmware="efi">
    <type arch="x86_64" machine="pc-q35-8.1">hvm</type>
    <firmware>
        <feature enabled="yes" name="enrolled-keys"/>
        <feature enabled="yes" name="secure-boot"/>
    </firmware>
    <loader readonly="yes" secure="yes" type="pflash">/usr/share/OVMF/OVMF_CODE_4M.ms.fd</loader>
    <nvram template="/usr/share/OVMF/OVMF_VARS_4M.ms.fd">/var/lib/libvirt/qemu/nvram/nixos_VARS.fd</nvram>
</os>
```

## Generating hardware description

TODO: fix in order to avoid disks stuff

```
sudo nixos-generate-config --root /mnt
```
## misc

set console font size
* setfont ter-v32n t

* https://nixos.org/manual/nixos/stable/#sec-installation-manual
* https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix

Inst via ssh
* https://joshrosso.com/c/nix-k8s/
* [nixos-bisect](https://euank.com/2022/05/11/nixos-bisect.html)
