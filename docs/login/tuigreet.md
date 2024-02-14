# tuigreet

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
