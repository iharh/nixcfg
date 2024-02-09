# sway

## articles

* https://drakerossman.com/blog/wayland-on-nixos-confusion-conquest-triumph

## presentation

* https://www.youtube.com/watch?v=E-OXixxpTbk

## wiki

* https://wiki.archlinux.org/title/sway

## community

* https://www.reddit.com/r/swaywm/

## cfg

* https://github.com/ymatsiuk/nixos-config/blob/main/greetd.nix
* https://github.com/swaywm/sway/blob/master/config.in

## display/login managers

* https://www.baeldung.com/linux/display-managers-install-uninstall
* https://github.com/apognu/tuigreet

??? lightdm-gtk-greeter
? other greeters
? no tuigreet

## greetd

* https://wiki.archlinux.org/title/Greetd
* https://wiki.archlinux.org/title/User:Ev/Greetd
* https://wiki.gentoo.org/wiki/Greetd
* https://github.com/kennylevinsen/greetd/tree/master
* https://raw.githubusercontent.com/bqv/rc/nixos/profiles/wayland.nix
* https://manpages.ubuntu.com/manpages/noble/en/man5/greetd.5.html

## regreet

* https://github.com/rharish101/ReGreet
* https://mephisto.cc/en/tech/greetd-regreet/

greetd pwd
greetd ls


## display managers wayland support

* https://wiki.archlinux.org/title/wayland#Display_managers
* https://github.com/canonical/lightdm/issues/267

## sway with greetd

* https://gist.github.com/p00f/5c0dd4539669806676677653cd7a5e40
* https://git.sr.ht/%7Ekennylevinsen/gtkgreet
* https://man.sr.ht/~kennylevinsen/greetd/
* https://mephisto.cc/en/tech/greetd-regreet/
* https://manpages.ubuntu.com/manpages/noble/en/man5/greetd.5.html
* https://wiki.archlinux.org/title/Greetd

apt/greetd

```

$ sudo systemctl status greetd.service
  greetd.service - Greeter daemon
     Loaded: loaded (/lib/systemd/system/greetd.service; disabled; preset: enabled)
     Active: inactive (dead)
```

wlgreet

```
/etc/greetd/sway-config
/etc/greetd/sway-config.d
/etc/greetd/wlgreet.toml
/usr/sbin/wlgreet
/usr/share/doc/wlgreet/changelog.Debian.gz
/usr/share/doc/wlgreet/copyright
```

```
etc/greetd/config.toml
/etc/needrestart/conf.d/50_greetd.conf
/etc/pam.d/greetd-greeter
/lib/systemd/system/greetd.service
/usr/sbin/agreety
/usr/sbin/greetd
/usr/share/doc/greetd/changelog.Debian.gz
/usr/share/doc/greetd/copyright
/usr/share/man/man1/agreety.1.gz
/usr/share/man/man1/greetd.1.gz
/usr/share/man/man5/greetd.5.gz
/usr/share/man/man7/greetd-ipc.7.gz
```

* https://www.simplified.guide/ubuntu/switch-to-gdm

```
sudo dpkg-reconfigure lightdm
sudo dpkg-reconfigure sddm

sudo dpkg-reconfigure greetd
Failed to preset unit, file "/etc/systemd/system/display-manager.service" already exists and is a symlink to "/lib/systemd/system/lightdm.service".
/usr/bin/deb-systemd-helper: error: systemctl preset failed on greetd.service: No such file or directory
    systemctl --system --preset-mode=enable-only preset greetd.service
    systemctl --root=/ --system --preset-mode=enable-only preset greetd.service
        Failed to preset unit, file "/etc/systemd/system/display-manager.service" already exists and is a symlink to "/lib/systemd/system/lightdm.service".

systemctl disable lightdm.service
systemctl enable --now greetd.service
    -//-

cat /lib/systemd/system/greetd.service
    Exec=greetd
```

```
    debug "Using systemctl preset to enable $scriptname";
    my $systemd_root = '/';
    if ($dpkg_root ne '') {
        $systemd_root = $dpkg_root;
    }
    system("systemctl",
           "--root=$systemd_root",
           $instance eq "user" ? "--global" : "--system",
           "--preset-mode=enable-only",
           "preset", $scriptname) == 0
        or error("systemctl preset failed on $scriptname: $!");
```

## super

* https://olegon.ru/showthread.php?t=38309

## inst on ubuntu

* https://www.dwarmstrong.org/sway/
* https://llandy3d.github.io/sway-on-ubuntu/simple_install/

## Ubuntu-sway

* https://www.opennet.ru/opennews/art.shtml?num=60017
* https://github.com/Ubuntu-Sway/ubuntu-sway-meta
* https://github.com/Ubuntu-Sway/Ubuntu-Sway-Remix
* https://github.com/Ubuntu-Sway/Ubuntu-Sway-Remix/wiki/FAQ

## regolith-desktop

* https://regolith-desktop.com/
* https://github.com/regolith-linux

## wayland

* https://www.baeldung.com/linux/display-server-xorg-wayland
