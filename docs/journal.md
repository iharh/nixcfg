# journal

https://github.com/NixOS/nixpkgs/issues/282145
```
Feb 17 16:21:11 ih-nixos make-initrd-ng[4564]: Warning: Couldn't satisfy dependency libc.so.6 for "/nix/store/9y8pmvk8gdwwznmkzxa6pwyah52xy3nk-glibc-2.38-27/lib/libm.so.6"
Feb 17 16:21:11 ih-nixos make-initrd-ng[4564]: Warning: Couldn't satisfy dependency ld-linux-x86-64.so.2 for "/nix/store/9y8pmvk8gdwwznmkzxa6pwyah52xy3nk-glibc-2.38-27/lib/libm.so.6"
Feb 17 16:21:11 ih-nixos make-initrd-ng[4564]: Warning: Couldn't satisfy dependency libc.so.6 for "/nix/store/9y8pmvk8gdwwznmkzxa6pwyah52xy3nk-glibc-2.38-2Feb 17 16:21:19 ih-nixos kernel: reserve setup_data: [mem 0x000000007c77f058-0x000000007ece1fff] usable

nix-shell -p nix-info --run "nix-info -m"
 - system: `"x86_64-linux"`
 - host os: `Linux 6.6.8, NixOS, 24.05 (Uakari), 24.05.20231230.b0d36bd`
 - multi-user?: `yes`
 - sandbox: `yes`
 - version: `nix-env (Nix) 2.18.1`
 - nixpkgs: `/nix/var/nix/profiles/per-user/root/channels/nixos`
```
