# greetd

## wiki

* https://nixos.wiki/wiki/Greetd
* https://wiki.archlinux.org/title/Greetd

## cfg

```
services.greetd = {
  enable = true;
  settings = {
    default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland"; user = "your_username";
    };
  };
};
```

* [with-wrapper](https://github.com/ymatsiuk/nixos-config/blob/main/greetd.nix)
* https://github.com/sjcobb2022/nixos-config/blob/main/hosts/common/optional/greetd.nix

cat /etc/systemd/system/greetd.service
```
[Unit]
After=systemd-user-sessions.service
After=plymouth-quit-wait.service
After=getty@tty1.service
Conflicts=getty@tty1.service
Wants=systemd-user-sessions.service

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
command = "/nix/store/449xak47f6wcz0rp6a269jn2p1p3y54k-tuigreet-0.8.0/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd sway"
user = "iharh"

[terminal]
vt = 1
```
