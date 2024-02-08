# sway

## articles

* https://drakerossman.com/blog/wayland-on-nixos-confusion-conquest-triumph

## wiki

* https://wiki.archlinux.org/title/sway

## community

* https://www.reddit.com/r/swaywm/

## cfg

* https://github.com/ymatsiuk/nixos-config/blob/main/greetd.nix
* https://github.com/swaywm/sway/blob/master/config.in

## display/login managers

* https://www.baeldung.com/linux/display-managers-install-uninstall

??? lightdm-gtk-greeter
? other greeters
? no tuigreet

## regreet

* https://github.com/rharish101/ReGreet
* https://mephisto.cc/en/tech/greetd-regreet/

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

* https://www.simplified.guide/ubuntu/switch-to-gdm

```
sudo dpkg-reconfigure lightdm
sudo dpkg-reconfigure sddm

sudo dpkg-reconfigure greetd
Failed to preset unit, file "/etc/systemd/system/display-manager.service" already exists and is a symlink to "/lib/systemd/system/lightdm.service".
/usr/bin/deb-systemd-helper: error: systemctl preset failed on greetd.service: No such file or directory
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
