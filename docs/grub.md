# grub

## src

https://github.com/NixOS/nixpkgs/blob/nixos-23.11/nixos/modules/system/boot/loader/grub/grub.nix

## need to read - tons of cool stuff

https://imgur.com/a/J69GbKa
https://www.reddit.com/r/NixOS/comments/bocx57/how_to_do_an_efi_boot_from_grub/
https://forums.gentoo.org/viewtopic-t-1061874-start-0.html
https://superuser.com/questions/1053388/grub2-install-error-boot-efi-doesnt-look-like-an-efi-partition-on-a-fresh-ge
    https://forums.gentoo.org/viewtopic-t-1031686.html?sid=a3bcc2409e63fe25a0baab32a3e4ce12
    https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Disks#Default:_Using_parted_to_partition_the_disk
https://discourse.nixos.org/t/configure-grub-on-efi-system/2926/
https://github.com/NixOS/nixpkgs/issues/61718
https://bbs.archlinux.org/viewtopic.php?id=279602
https://news.ycombinator.com/item?id=33455052
https://copyprogramming.com/howto/uefi-chainloading-grub-from-grub

## errors

setting up /etc...
updating GRUB 2 menu...
Failed to get blkid info (returned 512) for  on  at /nix/store/lp1mv1r919ncwm3f23apvxxb728zi6i9-install-grub.pl line 208.
installation finished!

blkid
echo $?

provided

...

installing the boot loader...
setting up /etc...
updating GRUB 2 menu...
installing the GRUB 2 boot loader into /boot...
Installing for x86_64-efi platform.
/nix/store/bjxcfnv97fi6flnkyj1dha5p4h5072qd-grub-2.12/sbin/grub-install: error: /boot doesn't look like an EFI partition.
/nix/store/lp1mv1r919ncwm3f23apvxxb728zi6i9-install-grub.pl: installation of GRUB EFI into /boot failed: No such file or directory
installation finished!

end of
nvim /nix/store/lp1mv1r919ncwm3f23apvxxb728zi6i9-install-grub.pl

https://www.linux.org.ru/forum/linux-install/10505616
    /dev/sda1 -> /boot/efi at fat32.
https://wiki.archlinux.org/title/GRUB#Common_installation_errors
https://github.com/NixOS/nixpkgs/issues/61718
https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles/blob/main/nixos/bootloader.nix

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
boot.loader.efi.canTouchEfiVariables = true;

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
