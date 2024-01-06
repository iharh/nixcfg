# disko

* [github](https://github.com/nix-community/disko/)
* [wiki](https://nixos.wiki/wiki/Disko)
* [quickstart](https://github.com/nix-community/disko/blob/master/docs/quickstart.md)
* [howto](https://github.com/nix-community/disko/blob/master/docs/HowTo.md)
* [reference](https://github.com/nix-community/disko/blob/master/docs/reference.md)


# articles

* https://bmcgee.ie/posts/2022/12/setting-up-my-new-laptop-nix-style/
* https://aldoborrero.com/posts/2023/01/15/setting-up-my-machines-nix-style/

# check later

* https://github.com/Mic92/dotfiles/blob/main/nixos/eve/modules/disko.nix

* https://github.com/Mic92/dotfiles/tree/main/terraform
* https://github.com/Mic92/dotfiles/blob/main/terraform/gitlab/repo-mirror.tf

* https://github.com/nix-community/disko/blob/master/docs/INDEX.md

* https://github.com/nix-community/disko/blob/master/example/stand-alone/configuration.nix

* https://github.com/wimpysworld/nix-config#iso-

# sample

https://github.com/Mic92/dotfiles/blob/main/nixos/eva/modules/disko.nix

Wimpy's World - NixOS & Linux | Tinkering with my Nix config ❄️ and poking at some Linux projects 0:00 of 2:22:09
https://www.youtube.com/watch?v=biVQ_-v8oEo

https://github.com/wimpysworld/nix-config/blob/main/scripts/install.sh#L53

curl -sL https://raw.githubusercontent.com/wimpysworld/nix-config/main/scripts/install.sh | bash -s <hostname> <username>

```
nix run github:nix-community/disko --no-write-lock-file -- -m create ./luks-btrfs.nix
nix run github:nix-community/disko --no-write-lock-file -- -m mount ./luks-btrfs.nix

sudo nix run github:nix-community/disko \
    --extra-experimental-features "nix-command flakes" \
    --no-write-lock-file \
    -- \
    --mode zap_create_mount \
    "nixos/$TARGET_HOST/disks.nix"
```
# by parted

/dev/vda1: TYPE="ext4" PARTLABEL="primary" LABEL="nixos"
/dev/vda2: TYPE="vfat" PARTLABEL="ESP"     LABEL="boot"  LABEL_FATBOOT="boot"

# by disko

/dev/vda2: TYPE="ext4" PARTLABEL="disk-vda-root" 
/dev/vda1: TYPE="vfat" PARTLABEL="disk-vda-ESP" SEC_TYPE="msdos"

??? BLOCK_SIZE
