# sway

* https://manpages.ubuntu.com/manpages/jammy/en/man5/sway.5.html

## ubuntu-sway

* https://ubuntusway.com/
* https://github.com/Ubuntu-Sway
* https://github.com/Ubuntu-Sway/Ubuntu-Sway-Remix

* https://github.com/Ubuntu-Sway/Ubuntu-Sway-Remix/wiki
* https://github.com/Ubuntu-Sway/Ubuntu-Sway-Remix/wiki/FAQ
* https://github.com/Ubuntu-Sway/Ubuntu-Sway-Remix/wiki/Configuration#config-files
* https://github.com/Ubuntu-Sway/Ubuntu-Sway-Remix/wiki/Virtualization#qemukvm

* https://github.com/Ubuntu-Sway/ubuntu-sway-default-settings
* https://github.com/Ubuntu-Sway/ubuntu-sway-default-settings/blob/noble/common/usr/share/wayland-sessions/ubuntusway.desktop
* https://github.com/Ubuntu-Sway/ubuntu-sway-default-settings/blob/noble/data/ubuntusway/bin/start-sway

* https://www.opennet.ru/opennews/art.shtml?num=60017
* https://github.com/Ubuntu-Sway/ubuntu-sway-meta

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

## ???

greetd pwd
greetd ls

## display managers wayland support

* https://wiki.archlinux.org/title/wayland#Display_managers
* https://github.com/canonical/lightdm/issues/267

## polkit

  security.polkit.enable = true;

## sway with greetd

* https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway#login-managers
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
/usr/sbin/wlgreet
/etc/greetd/sway-config
/etc/greetd/sway-config.d
/etc/greetd/wlgreet.toml
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

## regolith-desktop

* https://regolith-desktop.com/
* https://github.com/regolith-linux

## wayland

* https://www.baeldung.com/linux/display-server-xorg-wayland

## swayfx

* https://github.com/WillPower3309/swayfx
* https://github.com/MubinMuhammad/MinimalSwayFX

## issues

XDG_RUNTIME_DIR is not set in the environment. Aborting.

* https://www.reddit.com/r/freebsd/comments/lryw8a/xdg_runtime_dir_is_not_set_in_the_environment/
* https://github.com/swaywm/sway/issues/7202
* https://forums.gentoo.org/viewtopic-t-1074932-start-0.html
* https://forums.freebsd.org/threads/i-cant-turn-on-hikari-and-sway.84775/

prepare sway config

don't run sway as a root

check cfg
```
removing obsolete symlink ‘/etc/pam.d/swaylock’...
removing obsolete symlink ‘/etc/sway/config’...
removing obsolete symlink ‘/etc/sway/config.d/nixos.conf’...
removing obsolete symlink ‘/etc/xdg/xdg-desktop-portal/sway-portals.conf’...
```
