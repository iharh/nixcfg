# seat

## seatd

* https://sr.ht/~kennylevinsen/seatd/
* https://wiki.gentoo.org/wiki/Seatd
* https://wiki.archlinux.org/title/Sway#Starting
* https://man.archlinux.org/man/seatd.1.en

apt/seatd


cat /etc/default/seatd
```
# Allow access to video group members.
DAEMON_ARGS="-g video"
```

dpkg -L seatd
```
/etc/init.d/seatd
/lib/systemd/system/seatd.service
/usr/bin/seatd-launch
/usr/sbin/seatd
/usr/share/doc/seatd/README.md
/usr/share/doc/seatd/TODO.Debian
/usr/share/doc/seatd/changelog.Debian.gz
/usr/share/doc/seatd/copyright
/usr/share/man/man1/seatd-launch.1.gz
/usr/share/man/man8/seatd.8.gz
```

* https://docs.voidlinux.org/config/session-management.html#elogind

Install elogind as your session manager to automatically set up XDG_RUNTIME_DIR.


root # gpasswd -a $USER video
root # gpasswd -a $USER seat # I'm sure this is the problem

-- sudo usermod -a -G seat _greetd
-- no such group "seat"

## polkt
