# tuigreet

* https://github.com/NixOS/nixpkgs/tree/master/pkgs/applications/display-managers/greetd
* https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/display-managers/greetd/default.nix
* https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/display-managers/greetd/tuigreet.nix
* https://gitlab.archlinux.org/archlinux/packaging/packages/greetd-tuigreet/-/blob/main/PKGBUILD

/etc/greetd/
    few cfg files

## cfg

* https://github.com/manjaro-sway/iso-profiles/blob/sway/community/sway/Packages-Desktop#L33

cat /etc/passwd | grep greet
_greetd:x:112:126::/etc/greetd:/usr/sbin/nologin

sudo mkdir /var/cache/tuigreet
sudo chown _greetd:_greetd /var/cache/tuigreet
sudo chmod 0755 /var/cache/tuigreet

sudo -u _greetd id
# need to have a video
sudo usermod -a -G video _greetd


cat `/etc/greetd/config.toml`

```
[terminal]
vt = 1

[default_session]
command = "tuigreet --cmd sway"
user = "greeter"
```

previously
```
# command = "/usr/sbin/agreety --cmd /bin/sh"
command = "sway --config /etc/greetd/sway-config"
user = "_greetd"
```

The available sessions are fetched from `desktop` files in 
`/usr/share/xsessions` and `/usr/share/wayland-sessions`. 
If you want to provide custom directories, you can set the `--sessions` arguments with a colon-separated list of directories for `tuigreet` to fetch session definitions some other place.

cat /usr/share/wayland-sessions/sway.desktop
```
[Desktop Entry]
Name=Sway
Comment=An i3-compatible Wayland compositor
Exec=sway
Type=Application
```

cat /etc/greetd/sway-config
```
exec "/usr/sbin/wlgreet; swaymsg exit"

bindsym Mod4+shift+e exec swaynag \
        -t warning \
        -m 'What do you want to do?' \
        -b 'Poweroff' 'systemctl poweroff -i' \
        -b 'Reboot' 'systemctl reboot -i'

output * bg /etc/greetd/background fill

include /etc/sway/config.d/*
include /etc/greetd/sway-config.d/*
```

## inst

```
# cargo build
# sudo cp target/debug/tuigreet /usr/local/bin

# mkdir /var/cache/tuigreet
# chown _greetd:_greetd /var/cache/tuigreet
# chmod 0755 /var/cache/tuigreet
```

nixos
systemctl cat greetd.service
```
[Service]
Environment="LOCALE_ARCHIVE=/nix/store/5wiwq7rrysy112jwcjfjynbz4jyr0dxp-glibc-locales-2.38-27/lib/locale/locale-archive"
Environment="PATH=/nix/store/zx8aqgdy735qzk81glfwil6mbi6ddqb1-coreutils-9.4/bin:/nix/store/sq0w0jchkjqbxl47h52kfwa33qp1adfh-findutils-4.9.0/bin:/nix/store/by6918gg7srjyixqk8kbcdlz82d5pcwx-gnugrep-3.11/bin:/nix/store/7fqp73ncnbwr5bxxszqicf6r33d9yhkw-gnused-4.9/bin:/nix/store/iidxwcyp8pqhrq3iji17shs4m6gin0kv-systemd-254.6/bin:/nix/store/zx8aqgdy735qzk81glfwil6mbi6ddqb1-coreutils-9.4/sbin:/nix/store/sq0w0jchkjqbxl47h52kfwa33qp1adfh-findutils-4.9.0/sbin:/nix/store/by6918gg7srjyixqk8kbcdlz82d5pcwx-gnugrep-3.11/sbin:/nix/store/7fqp73ncnbwr5bxxszqicf6r33d9yhkw-gnused-4.9/sbin:/nix/store/iidxwcyp8pqhrq3iji17shs4m6gin0kv-systemd-254.6/sbin"
Environment="TZDIR=/nix/store/fq2gd82szj5g3hf8dq3wrd5lii6dpags-tzdata-2023c/share/zoneinfo"
X-RestartIfChanged=false
ExecStart=/nix/store/fhgzcb9y4g5cfsd5ahsscva4km28xs1b-greetd-0.9.0/bin/greetd --config /nix/store/8v099cdjcbjp8sn1hbz8wfvd5d30dq7q-greetd.toml
IgnoreSIGPIPE=false
KeyringMode=shared
Restart=always
SendSIGHUP=true
TimeoutStopSec=30s
Type=idle
```

cat /nix/store/8v099cdjcbjp8sn1hbz8wfvd5d30dq7q-greetd.toml
```
[terminal]
vt = 1
[default_session]
user = "iharh"
command = "/nix/store/449xak47f6wcz0rp6a269jn2p1p3y54k-tuigreet-0.8.0/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd sway"
```

cat /etc/greetd/config.toml
```
[terminal]
# The VT to run the greeter on. Can be "next", "current" or a number
# designating the VT.
vt = 7

# The default session, also known as the greeter.
[default_session]

# `agreety` is the bundled agetty/login-lookalike. You can replace `/bin/sh`
# with whatever you want started, such as `sway`.
# command = "/usr/sbin/agreety --cmd /bin/sh"
# if using wlgreet
command = "sway --config /etc/greetd/sway-config"

# The user to run the command as. The privileges this user must have depends
# on the greeter. A graphical greeter may for example require the user to be
# in the `video` group.
user = "_greetd"
```

systemctl cat greetd.service
```
# /usr/lib/systemd/system/greetd.service
[Unit]
Description=Greeter daemon
After=systemd-user-sessions.service plymouth-quit-wait.service
After=getty@tty7.service
Conflicts=getty@tty7.service
[Service]
Type=simple
ExecStart=greetd
IgnoreSIGPIPE=no
SendSIGHUP=yes
TimeoutStopSec=30s
KeyringMode=shared
Restart=always
RestartSec=1
StartLimitBurst=5
StartLimitInterval=30
[Install]
Alias=display-manager.service
```

TOLOOK:
https://rgoswami.me/posts/revisiting-wayland-2021-archlinux/
    /usr/local/bin/sway-run.sh, /usr/local/bin/wayland_enablement.sh
https://www.reddit.com/r/archlinux/comments/1431pqh/looking_for_help_trying_to_setup_greetd_with_sway/
https://man.sr.ht/~kennylevinsen/greetd/
    sway-run script with tons of vars
