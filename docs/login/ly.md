# ly

* https://github.com/fairyglade/ly
* https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/display-managers/ly/default.nix
* https://www.youtube.com/watch?v=JwudRbgLTNQ

closed
* https://github.com/NixOS/nixpkgs/pull/237912
* https://github.com/NixOS/nixpkgs/issues/150515
* https://github.com/NixOS/nixpkgs/issues/87809

```
services.xserver = {
    enable = true;
    layout = "us";
    desktopManager.enlightenment.enable = true;
    displayManager.ly = {
      enable = true;
      defaultUser = "bjorn";
    };
  };
```

open
* https://github.com/fairyglade/ly/issues/248

other
* https://gitlab.com/roosemberth/dotfiles/-/commit/dc50bb9e36613cad6612c46decaa74ea087bd66f
