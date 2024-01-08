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

! with flake-parts !
https://github.com/hercules-ci/flake-parts
    https://github.com/hercules-ci/flake-parts/tree/main/template/default

https://github.com/moni-dz/nix-config
    https://github.com/moni-dz/nix-config/tree/master/modules/parts
https://github.com/fufexan/dotfiles
    https://github.com/fufexan/dotfiles/blob/main/hosts/default.nix

! with-hyprland
https://github.com/wochap/nix-config
    https://github.com/wochap/nix-config/blob/main/flake.nix#L117

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
https://github.com/MCotocel/nixdots/tree/master/hosts/lithium#installing
https://github.com/chadcat7/crystal
    https://github.com/chadcat7/crystal/blob/main/flake.nix
    ! simple
https://github.com/johnk1917/nixrland
    ! flakes, but no good readme
https://github.com/enchanted-coder/nix-config/blob/main/nixos/configuration.nix
    ! mini
https://github.com/Icy-Thought/Snowflake
https://github.com/justinlime/dotfiles/blob/main/flake.nix
    !!! good abstractions and hyprland

## Labeling FS:

sudo tune2fs -L luks /dev/nvme0n1p3
sudo tune2fs -L luks /dev/dm-0

tune2fs: Bad magic number in super-block while trying to open /dev/nvme0n1p3
/dev/nvme0n1p3 contains a crypto_LUKS file system
...
I expect you have to perform tune2fs on this /dev/mapper/xxx-xxx, there is the visible ext4 filesystem.

l /dev/disk/by-label
good
    luks@ ⇒ ../../nvme0n1p2
    root@ ⇒ ../../nvme0n1p1
bad
    NO_LABEL@ ⇒ ../../nvme0n1p1

l /dev/mapper
before
    control
after (by label)
    luks@ ⇒ ../dm-0
    and after that it is available:
        /dev/dm-0
    blkid
        /dev/nvme0n1p2: UUID="..." LABEL="luks" TYPE="crypto_LUKS" PARTUUID="..."
after (by uuid)
    luks-788e6b7d-18de-4c73-973a-27126348c4cb@ ⇒ ../dm-0
    blkid
        /dev/mapper/luks-...: UUID="..." BLOCK_SIZE="4096" TYPE="ext4"

???
/dev/disk/by-partlabel

https://forum.endeavouros.com/t/how-to-create-new-uuid-for-external-drive/43391/5
https://unix.stackexchange.com/questions/12858/how-to-change-filesystem-uuid-2-same-uuid
https://unix.stackexchange.com/questions/257652/change-encrypted-partition-uuid
    For changing the file system UUID you have to decrypt /dev/sda1
        sudo cryptsetup luksOpen /dev/disk/by-uuid/788e6b7d-18de-4c73-973a-27126348c4cb luks-788e6b7d-18de-4c73-973a-27126348c4cb
    and then run tune2fs on the decrypted device mapper device.

    To change the UUID of the LUKS volume, use cryptsetup luksUUID --uuid=<the new UUID> /dev/sda1.

https://superuser.com/questions/1393014/change-partitions-labels-only-on-dolphin-or-change-label-on-not-mounted-luks-pa
    sudo cryptsetup status /dev/mapper/luks-788e6b7d-18de-4c73-973a-27126348c4cb
        ...
        type: LUKS1
        ...
    sudo cryptsetup convert /dev/nvme0n1p3 --type luks2 --debug
    sudo cryptsetup config /dev/nvme0n1p3 --label luks


## LUKS

https://fedoraproject.org/wiki/Disk_Encryption_User_Guide
https://geekpeek.net/disk-encryption-on-centos-linux/

https://julien.coubronne.net/en/2017/02/03/luks-backups-and-headers/
https://dradis.com/support/guides/customization/auto-unlock-luks-encrypted-drive.html

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

fs0:
cd EFI
cd BOOT
BOOTX64.EFI

https://habr.com/ru/articles/680270/
https://habr.com/ru/articles/314412/
https://www.rodsbooks.com/efi-bootloaders/installation.html
https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface/Secure_Boot

## virsh

* list --all
* edit <domain>
* dumpxml <domain>
* domblklist --domain <domain>
* change-media <domain> --path sda --eject
* change-media <domain> --path sda --source $ISO --insert --config
* attach-disk --driver file --type cdrom --mode readonly --domain guest01 --source /root/disc1.iso --target hdc --config
* start <domain>
* net-dhcp-leases default
* console <domain>
* undefine --nvram <domain>
* destroy

virt-manager --connect qemu:///system --show-domain-console <domain>

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
nix-env -iA nixos.ripgrep nixos.nixFlakes nixos.gitMinimal nixos.gh nixos.neovim
```

## Cloning this configuration repository

```
export GH_TOKEN=...your-own-token...
gh repo clone iharh/nixcfg
cd nixcfg
gh repo sync
sh/prepare-all.sh <vda|...>
cat /mnt/etc/nixos/hardware-configuration.nix
cat /mnt/etc/nixos/configuration.nix
```
## Installing kaku

https://github.com/linuxmobile/kaku/
    git clone --depth 1 https://github.com/linuxmobile/kaku
    nixos-generate-config --force --dir $HOME/kaku/hosts/aesthetic
    rm -rf $HOME/kaku/hosts/aesthetic/configuration.nix
    cd kaku
    sudo nixos-install --flake .#aesthetic
        warning: input 'nh' has an override for a non-existent input 'flake-parts'

        git config --global --add safe.directory /mnt/etc/nixos

        error: hash mismatch in fixed-output derivation '/nix/store/vszqrsf7wylfr1b7akagc5l70idv5v4y-antfu-unocss.zip.drv':
            specified: sha256-diwvMl88Nfq3QPm6AygiQpoFm82hSelpnU5KCOSU0pE=
            got:       sha256-fl7uJFjrCKfQy3YkpttA0N6GRtFsqw82m2w4hQ2xRsE=

        https://github.com/linuxmobile/kaku/blob/main/home/software/vscode.nix

        vim home/software/vscode.nix
        name = "catpuccin-perfect-icons";
        sha256 = "sha256-aTQCIqwBTvd0oARcgAnsp6FQY6R51DqJ/HLgNxsLPjk=";

        name = "copilot-chat";
        sha256 = "sha256-KgwhPK19B+PBFeMhUOtfUtW14QUBc4yMIA80SToqomQ=";
        name = "unocss";
        sha256 = "sha256-fl7uJFjrCKfQy3YkpttA0N6GRtFsqw82m2w4hQ2xRsE=";

        vim pkgs/xwaylandvideobridge/default.nix
        repo = "xwaylandvideobridge";
        hash = "sha256-0HD5++cPvsx+bsdgCzn515KPtS1bj6JTKldxKdWEcKs=";

## Grub stuff

https://unix.stackexchange.com/questions/612813/virt-manager-change-firmware-after-installation
    --boot uefi
    https://superuser.com/questions/1571326/how-to-boot-a-uefi-image-from-a-kvm-virtual-machine-without-virt-manager-e-g
    https://andreaskaris.github.io/blog/linux/libvirt-uefi-without-secureboot/
    https://docs.fedoraproject.org/en-US/quick-docs/uefi-with-qemu/
    https://www.howtoforge.com/enable-uefi-support-on-kvm-virtualization/

https://www.howtoforge.com/enable-uefi-support-on-kvm-virtualization/
    --boot uefi
https://serverfault.com/questions/899290/kvm-gets-stuck-at-booting-from-hard-disk

boot.loader.grub.efiInstallAsRemovable = true;
```
installing the boot loader...
setting up /etc...
updating GRUB 2 menu...
installing the GRUB 2 boot loader into /boot...
Installing for x86_64-efi platform.
Installation finished. No error reported.
installation finished!
```
boot.loader.efi.canTouchEfiVariables = true;

## problems

https://community.synology.com/enu/forum/1/post/151326
Stops at "Booting from hard disk..."
Resolved the issue, changed BIOS from legacy to UEFI.

```
installing the boot loader...
setting up /etc...
updating GRUB 2 menu...
Failed to get blkid info (returned 512) for  on  at /nix/store/lp1mv1r919ncwm3f23apvxxb728zi6i9-install-grub.pl line 208.
installation finished!
```
https://github.com/NixOS/nixpkgs/issues/130125
https://discourse.nixos.org/t/solved-mirroredboots-with-on-tmpfs-build-error-failed-to-get-blkid-info-for-on-tmpfs-at-install-grub-pl/14065
https://gist.github.com/byrongibson/ff2a6befdf53b94d9ea50fc8441fd35d
https://stackoverflow.com/questions/10373100/blkid-not-giving-output-in-linux-when-run-in-file
blkid -o export /dev/vda
? https://discourse.nixos.org/t/nixos-rebuild-switch-is-failing-to-install-grub-boot-partition-disappeared/30773


sudo grub-install /dev/vda
grub-install: error: /nix/store/3wqpdkgms96f36n1sgnps6hvwcdinrwy-grub-2.12/lib/grub/x86_64-efi/modinfo.sh doesn't exist. Please specify --target or --directory.

## Other

https://forums.opensuse.org/t/grub2-install-error-with-efi-on-raid1-error-at-boot-verification-requested-but-nobody-cares/143506/23
https://www.linux.org.ru/forum/general/16404940
    mount -t efivarfs efivarfs /sys/firmware/efi/efivars
https://bbs.archlinux.org/viewtopic.php?id=279445
    https://www.rodsbooks.com/efi-bootloaders/fallback.html
    https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf
    https://wiki.debian.org/UEFI
https://www.linux.org.ru/forum/linux-install/16089446
    –efi-directory=/efi
    https://www.youtube.com/watch?v=Wssy2tz2k90
https://superuser.com/questions/1738694/linux-from-scratch-efi-variables-are-not-supported-on-this-system
https://forum.endeavouros.com/t/install-failure/11781/12
https://ubuntuforums.org/archive/index.php/t-2448929.html
https://forum.endeavouros.com/t/installation-failed-due-to-a-grub-installation-issue/33639/18


https://nixos.wiki/wiki/Bootloader
https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/installer/tools/nixos-install.sh
    sudo nixos-rebuild --install-bootloader boot
https://github.com/NixOS/nixpkgs/issues/244643
https://docs.fedoraproject.org/en-US/quick-docs/grub2-bootloader/

!!!
https://github.com/mcdonc/.nixconfig/tree/master/hosts/profiles/grub
https://github.com/mcdonc/.nixconfig/blob/master/hosts/profiles/grub/efi.nix
https://github.com/mcdonc/.nixconfig/blob/master/videos/ardour/configuration.nix
https://github.com/mcdonc/.nixconfig/blob/master/flake.nix
https://github.com/mcdonc/.nixconfig/blob/master/prepsystem.sh

## Generating hardware description

TODO: fix in order to avoid disks stuff

```
sudo nixos-generate-config --root /mnt
```
# Update flake
```
nix --extra-experimental-features "nix-command flakes" flake update
```
https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake-update

??? lock --commit-lock-file

# Installation itself

## Dry Run

```
sudo nixos-rebuild dry-build --flake .#ih-nixos
```

## Final Installation

```
sh/inst-ih-nixos.sh
sudo nixos-install -v --show-trace --flake .#ih-nixos
sudo nixos-install -v --show-trace --no-root-passwd --flake .#ih-nixos
```
