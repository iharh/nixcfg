# switch

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

sudo systemctl disable lightdm.service
sudo systemctl enable --now greetd.service
    -//-

cat /lib/systemd/system/greetd.service
    Exec=greetd
```
