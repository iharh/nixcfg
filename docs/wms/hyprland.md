# hyprland

## wiki

* https://wiki.hyprland.org/Nix/Hyprland-on-Home-Manager/

## at qemu

* https://github.com/hyprwm/Hyprland/issues/797
* https://github.com/hyprwm/Hyprland/issues/1056
* https://wiki.hyprland.org/Getting-Started/Quick-start/#wrapping-the-launcher-recommended
* https://github.com/donovanglover/nix-config/blob/10ccd698facdc9306c7b15291ada968b4b9cf8c6/modules/virtualization.nix#L17-L25

cat ~/.local/share/sddm/wayland-session.log

# greetd

* https://github.com/apognu/tuigreet
* https://man.sr.ht/%7Ekennylevinsen/greetd/
* https://sr.ht/~kennylevinsen/greetd/
* https://git.sr.ht/~kennylevinsen/greetd/
* https://wiki.archlinux.org/title/Greetd
* https://github.com/donovanglover/nix-config/blob/master/modules/greetd.nix

bin/tuigreet

## presentations

* [BazilSafronov - Hyprland Review](https://www.youtube.com/watch?v=wsDDaJ7ZLxo)
* https://github.com/bazilsafronov/hyprdots
* https://www.youtube.com/watch?v=ZQjfv0OptIQ
* https://www.youtube.com/watch?v=qb1jrTY72gw

## reddit

* https://www.reddit.com/r/NixOS/comments/1734ha8/hyprland_homemanager_best_practice/
* https://www.reddit.com/r/NixOS/comments/14t6mto/really_confused_about_hyprland_flakes_and/
* https://www.reddit.com/r/NixOS/comments/14nyj0b/how_to_enable_wayland_on_nixos_or_confusion/
* https://www.reddit.com/r/NixOS/comments/1afquyx/cant_log_into_hyprland_when_configured_through/
* https://drakerossman.com/blog/wayland-on-nixos-confusion-conquest-triumph
* https://github.com/AtaraxiaSjel/nixos-config/blob/master/profiles/workspace/hyprland/default.nix#L58

## Configuration Samples

* https://github.com/donovanglover/nix-config/blob/master/home/hyprland.nix
* https://github.com/Obnomus/Hyprland-V2
* https://github.com/dedSyn4ps3/nixos_desktop_configs
* https://github.com/AviiNL/dotfiles/blob/main/home-manager/desktop/wayland/hyprland.nix
* https://github.com/konradmalik/dotfiles/blob/main/home/konrad/common/optional/desktop/hyprland/default.nix
* https://www.youtube.com/watch?v=6RNaBRSy-Zs

### ahbk

* https://github.com/ahbk/my-nixos/blob/master/modules/hypr.nix

### NaniNoni

* https://github.com/NaniNoni/nixos
* https://github.com/NaniNoni/nixos/blob/main/home.nix#L8
* https://github.com/NaniNoni/nixos/blob/main/configuration.nix

### ryan4yin

* https://github.com/ryan4yin/nix-config/
* https://github.com/ryan4yin/nix-config/blob/main/modules/nixos/desktop.nix#L30_L60
* https://github.com/ryan4yin/nix-config/blob/main/flake.nix

### Tyler Kelley ZaneyOS

* https://gitlab.com/Zaney/zaneyos
* https://www.youtube.com/watch?v=saDtVtQtsJc
* https://gitlab.com/Zaney/zaneyos/-/tree/main/config/system
* https://gitlab.com/Zaney/zaneyos/-/blob/main/flake.nix
* https://gitlab.com/Zaney/zaneyos/-/blob/main/config/home/hyprland.nix
* https://gitlab.com/Zaney/zaneyos/-/blob/main/config/home/packages.nix

### KnutHoltet

* https://github.com/KnutHoltet/nixos-config/blob/main/nixos/hyprland.nix
* https://github.com/KnutHoltet/nixos-config/blob/main/nixos/display-manager.nix
* https://github.com/KnutHoltet/nixos-config/blob/main/nixos/users.nix
* https://github.com/KnutHoltet/nixos-config/blob/main/home-files/.config/wezterm/wezterm.lua

sway
* https://gitlab.com/Zaney/zaneyos/-/blob/main/config/home/swaylock.nix
* https://gitlab.com/Zaney/zaneyos/-/blob/main/config/home/swaync.nix

waybar
* https://gitlab.com/Zaney/zaneyos/-/blob/main/config/home/style1-waybar.nix
* https://gitlab.com/Zaney/zaneyos/-/blob/main/config/home/style2-waybar.nix

sddm theme derivation
* https://gitlab.com/Zaney/zaneyos/-/blob/main/config/pkgs/sddm-sugar-dark.nix
* https://gitlab.com/Zaney/zaneyos/-/blob/main/config/pkgs/sddm-tokyo-night.nix

hm
* https://gitlab.com/Zaney/zaneyos/-/blob/main/home.nix
* https://gitlab.com/Zaney/zaneyos/-/blob/main/config/home/files.nix

writeshellscript
* https://gitlab.com/Zaney/zaneyos/-/blob/main/config/scripts/themechange.nix

starship
* https://gitlab.com/Zaney/zaneyos/-/blob/main/config/home/files/starship.toml
* https://gitlab.com/Zaney/zaneyos/-/blob/main/config/home/starship.nix

## todo inside hm

https://github.com/AtaraxiaSjel/nixos-config/blob/master/profiles/workspace/hyprland/default.nix
https://github.com/NixOS/nixpkgs/issues/57602

## app launchers

* https://wiki.hyprland.org/Useful-Utilities/App-Launchers/
* https://github.com/philj56/tofi
* https://www.youtube.com/watch?v=4O3D5TIt_0Q

## inst log

```
building the system configuration...
stopping the following units: systemd-sysctl.service, systemd-udevd-control.socket, systemd-udevd-kernel.socket, systemd-udevd.service
NOT restarting the following changed units: greetd.service
activating the configuration...
setting up /etc...
removing obsolete symlink ‘/etc/pam.d/swaylock’...
removing obsolete symlink ‘/etc/sway/config’...
removing obsolete symlink ‘/etc/sway/config.d/nixos.conf’...
removing obsolete symlink ‘/etc/xdg/xdg-desktop-portal/sway-portals.conf’...
reloading user units for iharh...
setting up tmpfiles
reloading the following units: dbus.service
starting the following units: systemd-sysctl.service, systemd-udevd-control.socket, systemd-udevd-kernel.socket
the following new units were started: display-manager.service, user-175.slice, user-runtime-dir@175.service, user@175.service
```
