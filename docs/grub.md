# grub

## src

https://github.com/NixOS/nixpkgs/blob/nixos-23.11/nixos/modules/system/boot/loader/grub/grub.nix

## errors

setting up /etc...
updating GRUB 2 menu...
Failed to get blkid info (returned 512) for  on  at /nix/store/lp1mv1r919ncwm3f23apvxxb728zi6i9-install-grub.pl line 208.
installation finished!

blkid
echo $?

provided


installing the boot loader...
setting up /etc...
updating GRUB 2 menu...
installing the GRUB 2 boot loader into /boot...
Installing for x86_64-efi platform.
/nix/store/bjxcfnv97fi6flnkyj1dha5p4h5072qd-grub-2.12/sbin/grub-install: error: /boot doesn't look like an EFI partition.
/nix/store/lp1mv1r919ncwm3f23apvxxb728zi6i9-install-grub.pl: installation of GRUB EFI into /boot failed: No such file or directory
installation finished!

! need to read - tons of cool stuff
https://github.com/NixOS/nixpkgs/issues/61718
https://bbs.archlinux.org/viewtopic.php?id=279602
