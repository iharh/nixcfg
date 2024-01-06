# disko

* [github](https://github.com/nix-community/disko/)
* [wiki](https://nixos.wiki/wiki/Disko)
* [quickstart](https://github.com/nix-community/disko/blob/master/docs/quickstart.md)
* [reference](https://github.com/nix-community/disko/blob/master/docs/reference.md)

# articles

* https://bmcgee.ie/posts/2022/12/setting-up-my-new-laptop-nix-style/

# check later

* https://github.com/wimpysworld/nix-config#iso-

# sample

Wimpy's World - NixOS & Linux | Tinkering with my Nix config ❄️ and poking at some Linux projects 0:00 of 2:22:09
https://www.youtube.com/watch?v=biVQ_-v8oEo

https://github.com/wimpysworld/nix-config/blob/main/scripts/install.sh#L53

curl -sL https://raw.githubusercontent.com/wimpysworld/nix-config/main/scripts/install.sh | bash -s <hostname> <username>

```
sudo nix run github:nix-community/disko \
    --extra-experimental-features "nix-command flakes" \
    --no-write-lock-file \
    -- \
    --mode zap_create_mount \
    "nixos/$TARGET_HOST/disks.nix"
```
