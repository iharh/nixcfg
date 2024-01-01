# Prereq

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

# NixOS Installation

/usr/share/virt-manager/virtinst/virtinstall.py

One day I realized, that it would be good to have step-by-step tutorial for installing NixOS.
Of cause, the standard one is a pretty good starting, point:
* [Installing NixOS](https://nixos.org/manual/nixos/unstable/index.html#sec-installation)
* [ih-libvirt](https://github.com/iharh/notes/blob/main/os/linux/nixos/inst/ih/ih-libvirt.txt)
* [my-nixos](https://github.com/iharh/notes/blob/main/os/linux/nixos/inst/ih/my-nixos.txt)
* [Creating Guests with virt-install](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-guest_virtual_machine_installation_overview-creating_guests_with_virt_install)
* [nixos-in-libvirt-21](https://www.technicalsourcery.net/posts/nixos-in-libvirt/)

good samples to check
* [virt-install-nixos](https://github.com/wstein/virt-install-nixos)
* [virt-install-examples](https://www.golinuxcloud.com/virt-install-examples-kvm-virt-commands-linux/)

https://www.youtube.com/watch?v=fDxhkSnFSPw
* customize configuration before install
* firmware - UEFI
* boot device order -> SATA CDROM 1

Exiting the console
* To exit the console, hold the CTRL key and press ], then press Enter.

But it lacks a some modern/advanced features, listed below.
So, I decided to start from the ground up and move slowly to the modern state of the art approaches, like:
* [flakes](https://github.com/NixOS/nix/blob/master/src/nix/flake.md)
* modularity
* [flake-parts](https://flake.parts)
* flake-utils and flake-utils-plus ?
* [kvm](https://github.com/iharh/notes/tree/main/devops/virt/kvm)

find https://github.com/search?q=%22nix+flake+new%22&type=code
* https://github.com/rencire/flake-templates

Eric Tossel Sample Config
* [dots](https://github.com/erictossell/nixflakes)
* [minimal-install-no-flakes](https://github.com/erictossell/nixflakes/blob/main/docs/minimal-install.md)
* [usage-flake-templates](https://github.com/erictossell/nixflakes/blob/main/docs/usage.md)

nix --extra-experimental-features "nix-command flakes" flake new -t 'github:erictossell/nixflakes' ./nixflakes && cd nixflakes
chmod +x sh/build.sh
sudo sh/build.sh
git init
git add .
nix --extra-experimental-features "nix-command flakes" flake check
sudo nixos-rebuild switch --flake '.#hostname'
sudo nixos-rebuild switch --flake '.#ihnixos'
sudo nixos-rebuild switch --flake .

https://github.com/NixOS/nix/issues/9165
    --show-trace
https://github.com/NixOS/nix/issues/3872#issuecomment-1637052258

!! other templatized flakes
https://github.com/Misterio77/nix-starter-configs
    git init nixaaa
    cd nixaaa
    nix --extra-experimental-features "nix-command flakes" flake init -t github:misterio77/nix-starter-config#minimal
    ...
    edit flake.nix
    nixos-generate-config --root /mnt
https://github.com/cruel-intentions/devshell-files
    nix develop github:cruel-intentions/devshell-files --build
https://github.com/konradmalik/dotfiles
https://github.com/ivi-vink/flake/blob/master/templates/rust/flake.nix
https://github.com/alex007sirois/nix-config
https://github.com/dojo-developpement-paris/dojo-developpement-paris.github.io/blob/main/2023/12/22/molkky/flake.nix
https://github.com/schromp/nixconfig
https://github.com/schromp/nixconfig/blob/master/flake.nix
    ! ypr, ..
https://github.com/LongerHV/nixos-configuration
https://github.com/colemickens/nixos-flake-example
    ! old, but using nixos-rebuild
    sh <(curl -L https://nixos.org/nix/install) --no-daemon
https://github.com/adfaure/nix_configuration
    ! not templates
https://github.com/dmadisetti/.dots/tree/template
    ! templating via github
    https://github.com/dmadisetti/.dots/blob/template/nix/machines/momento.nix
    https://github.com/dmadisetti/.dots/actions/workflows/iso.yml

Labeling FS:
*  sudo tune2fs -L "<label>" /dev/sd<N>

Taraday - macos
* https://www.tweag.io/blog/2023-02-09-nixos-vm-on-macos/

Inst via ssh
* https://joshrosso.com/c/nix-k8s/
* [nixos-bisect](https://euank.com/2022/05/11/nixos-bisect.html)

set console font size
* setfont ter-v32n t

misc
* https://nixos.org/manual/nixos/stable/#sec-installation-manual
* https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/image/repart.nix

## UEFI shell

* S-F12 - to exit capture cursor mode
* https://superuser.com/questions/1412403/how-to-scroll-up-and-down-in-efi-shell
* help -b
* PgUp, S-PgUp
* mode col row
* drivers
* drvcfg
* drvdiag
* devices
* devtree
* dh -b
* cd
* ls -r -a ... blkN:
* map
* getmtc - display current monotonic counter value
* bcfg boot dump -v
* reset -w | -s | -c  -- reboot

BLK0

fs0:\EFI\boot

https://habr.com/ru/articles/680270/
https://habr.com/ru/articles/314412/
https://www.rodsbooks.com/efi-bootloaders/installation.html
https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface/Secure_Boot

## virsh

* list --all
* virsh dumpxml <domain>
* change-media <domain> --path sda --source $ISO --insert --config
* attach-disk --driver file --type cdrom --mode readonly --domain guest01 --source /root/disc1.iso --target hdc --config
* start <domain>
* net-dhcp-leases default
* console <domain>
* undefine --nvram <domain>
* destroy

/dev/vda

SATA CDROM 1 - no media selected
https://superuser.com/questions/239870/change-cd-rom-via-virsh
https://github.com/cockpit-project/cockpit/issues/13454

```
<disk type="file" device="cdrom">
  <driver name="qemu" type="raw"/>
  <source file="/home/iharh/Downloads/dist/nixos/nixos-minimal-23.11.2413.32f63574c85f-x86_64-linux.iso" index="1"/>
  <backingStore/>
  <target dev="sda" bus="sata"/>
  <readonly/>
  <alias name="sata0-0-0"/>
  <address type="drive" controller="0" bus="0" target="0" unit="0"/>
</disk>
```

To log in over ssh you must set a password for either "nixos" or "root" with `passwd`
(prefix with `sudo` for "root"), or add your public key to
/home/nixos/.ssh/authorized_keys or /root/.ssh/authorized_keys.

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
sh/prepare-all.sh <vda|...>
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
