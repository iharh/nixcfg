# links

* https://hoverbear.org/blog/declarative-gnome-configuration-in-nixos/
* https://github.com/Mic92/dotfiles/blob/main/tasks.py (?kexec-installer)
* https://github.com/nix-community/nix-index#usage-as-a-command-not-found-replacement

# flakes

```
  inputs = {
    # -22.11
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    # Home manager
    # home-manager.url = "github:nix-community/home-manager";
    # home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    #     https://github.com/Misterio77/nix-colors
    # nix-colors.url = "github:misterio77/nix-colors";
  };
```

# console font
* setfont ter-v32n t

# inst via ssh
* https://joshrosso.com/c/nix-k8s/

swapDevices = [ ];

# wezterm

* https://github.com/Mic92/dotfiles/blob/main/nixos/modules/wezterm.nix

# Tons of interesting stuff

* https://github.com/wimpysworld/nix-config/blob/main/nixos/default.nix

* https://github.com/m0lentum/dotfiles/blob/master/nixos/configuration-common.nix
* https://github.com/m0lentum/dotfiles/blob/master/nixos/configuration-molelap.nix
* https://github.com/m0lentum/dotfiles/blob/master/nixos/configuration-moletable.nix

* https://github.com/Mic92/dotfiles/tree/main/nixos/modules
* https://github.com/Mic92/dotfiles/blob/main/nixos/modules/nix-daemon.nix
* https://github.com/Mic92/dotfiles/blob/main/nixos/modules/networkd.nix
* https://github.com/Mic92/dotfiles/blob/main/nixos/modules/minimal-docs.nix
* https://github.com/Mic92/dotfiles/blob/main/nixos/modules/make-linux-fast.nix
* https://github.com/Mic92/dotfiles/blob/main/nixos/eva/configuration.nix
* https://github.com/Mic92/dotfiles/blob/main/nixos/bernie/configuration.nix
* https://github.com/Mic92/dotfiles/blob/main/nixos/blob64/configuration.nix
* https://github.com/Mic92/dotfiles/blob/main/nixos/blob64/hardware-configuration.nix
* https://github.com/Mic92/dotfiles/blob/main/nixos/eva/modules/telegraf/krebs.nix
* https://github.com/Mic92/dotfiles/tree/main/nixos/blob64/fancontrol
* https://github.com/Mic92/dotfiles/blob/main/nixos/eva/modules/loki.nix
* https://github.com/Mic92/dotfiles/tree/main/nixos/turingmachine/modules
* https://github.com/Mic92/dotfiles/tree/main/nixos/turingmachine/modules/toggle-keyboard


* https://github.com/Mic92/dotfiles/blob/main/nixos/modules/i3.nix
* https://github.com/Mic92/dotfiles/blob/main/nixos/modules/sway.nix

packaging
* https://github.com/Mic92/dotfiles/blob/main/nixos/modules/packages.nix

nix-ld
* https://github.com/Mic92/dotfiles/blob/main/nixos/modules/nix-ld.nix

with wayland
* https://github.com/Mic92/dotfiles/blob/main/nixos/modules/qtile.nix
