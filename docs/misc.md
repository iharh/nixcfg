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
