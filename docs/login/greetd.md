# greetd

## wiki

* https://nixos.wiki/wiki/Greetd
* https://wiki.archlinux.org/title/Greetd

## cfg

```
services.greetd = {
  enable = true;
  settings = {
    default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland"; user = "your_username";
    };
  };
};
```

* [with-wrapper](https://github.com/ymatsiuk/nixos-config/blob/main/greetd.nix)
* https://github.com/sjcobb2022/nixos-config/blob/main/hosts/common/optional/greetd.nix
