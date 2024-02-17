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

## Crashes-and-Bugs

* https://wiki.hyprland.org/Crashes-and-Bugs/

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

coredump
```
Feb 17 07:18:58 ih-nixos systemd-logind[800]: New session 5 of user iharh.
Feb 17 07:18:58 ih-nixos systemd[1]: Started Session 5 of User iharh.
Feb 17 07:18:58 ih-nixos systemd[1]: Started Process Core Dump (PID 1265/UID 0).
Feb 17 07:18:59 ih-nixos systemd-coredump[1266]: Process 1236 (.Hyprland-wrapp) of user 1000 dumped core.
                                                 Module libxml2.so.2 without build-id.
                                                 Module libncursesw.so.6 without build-id.
                                                 Module libxshmfence.so.1 without build-id.
                                                 Module libxcb-sync.so.1 without build-id.
                                                 Module libxcb-dri2.so.0 without build-id.
                                                 Module libX11-xcb.so.1 without build-id.
                                                 Module libpcre.so.1 without build-id.
                                                 Module libbrotlicommon.so.1 without build-id.
                                                 Module libgraphite2.so.3 without build-id.
                                                 Module libdatrie.so.1 without build-id.
                                                 Module libselinux.so.1 without build-id.
                                                 Module libpcre2-8.so.0 without build-id.
                                                 Module libgudev-1.0.so.0 without build-id.
                                                 Module libbrotlidec.so.1 without build-id.
                                                 Module libbz2.so.1 without build-id.
                                                 Module libxcb-randr.so.0 without build-id.
                                                 Module libexpat.so.1 without build-id.
                                                 Module libpangoft2-1.0.so.0 without build-id.
                                                 Module libharfbuzz.so.0 without build-id.
                                                 Module libthai.so.0 without build-id.
                                                 Module libfribidi.so.0 without build-id.
                                                 Module libGLX.so.0 without build-id.
                                                 Module libcap.so.2 without build-id.
                                                 Module libXdmcp.so.6 without build-id.
                                                 Module libXau.so.6 without build-id.
                                                 Module libwacom.so.9 without build-id.
                                                 Module libevdev.so.2 without build-id.
                                                 Module libmtdev.so.1 without build-id.
                                                 Module libGLdispatch.so.0 without build-id.
                                                 Module libXrender.so.1 without build-id.
                                                 Module libXext.so.6 without build-id.
                                                 Module libX11.so.6 without build-id.
                                                 Module libfreetype.so.6 without build-id.
                                                 Module libfontconfig.so.1 without build-id.
                                                 Module libpng16.so.16 without build-id.
                                                 Module libz.so.1 without build-id.
                                                 Module libxcb-errors.so.0 without build-id.
                                                 Module libxcb-res.so.0 without build-id.
                                                 Module libxcb-icccm.so.4 without build-id.
                                                 Module libxcb-ewmh.so.2 without build-id.
                                                 Module libxcb-composite.so.0 without build-id.
                                                 Module libxcb-xinput.so.0 without build-id.
                                                 Module libxcb-xfixes.so.0 without build-id.
                                                 Module libxcb-shm.so.0 without build-id.
                                                 Module libxcb-render-util.so.0 without build-id.
                                                 Module libxcb-render.so.0 without build-id.
                                                 Module libxcb-present.so.0 without build-id.
                                                 Module libxcb-dri3.so.0 without build-id.
                                                 Module libliftoff.so.0 without build-id.
                                                 Module libdisplay-info.so.1 without build-id.
                                                 Module libseat.so.1 without build-id.
                                                 Module libudev.so.1 without build-id.
                                                 Module libvulkan.so.1 without build-id.
                                                 Module libGLESv2.so.2 without build-id.
                                                 Module libffi.so.8 without build-id.
                                                 Module libgcc_s.so.1 without build-id.
                                                 Module libstdc++.so.6 without build-id.
                                                 Module libpangocairo-1.0.so.0 without build-id.
                                                 Module libpango-1.0.so.0 without build-id.
                                                 Module libGL.so.1 without build-id.
                                                 Module libudis86.so.0 without build-id.
                                                 Module libsystemd.so.0 without build-id.
                                                 Module libxcb.so.1 without build-id.
                                                 Module libinput.so.10 without build-id.
                                                 Module libxkbcommon.so.0 without build-id.
                                                 Module libEGL.so.1 without build-id.
                                                 Module libdrm.so.2 without build-id.
                                                 Module libwlroots.so.13 without build-id.
                                                 Module .Hyprland-wrapped without build-id.
                                                 Stack trace of thread 1236:
                                                 #0  0x00007f0e4b7c202c __pthread_kill_implementation (libc.so.6 + 0x8d02c)
                                                 #1  0x00007f0e4b772e06 raise (libc.so.6 + 0x3de06)
                                                 #2  0x00007f0e4b75b8f5 abort (libc.so.6 + 0x268f5)
                                                 #3  0x00000000004a4569 _Z25handleUnrecoverableSignali (.Hyprland-wrapped + 0xa4569)
                                                 #4  0x00007f0e4b772eb0 __restore_rt (libc.so.6 + 0x3deb0)
                                                 #5  0x00007f0e4b7c202c __pthread_kill_implementation (libc.so.6 + 0x8d02c)
                                                 #6  0x00007f0e4b772e06 raise (libc.so.6 + 0x3de06)
                                                 #7  0x00007f0e4b75b8f5 abort (libc.so.6 + 0x268f5)
                                                 #8  0x00007f0e4baacc0b _ZN9__gnu_cxx27__verbose_terminate_handlerEv.cold (libstdc++.so.6 + 0xacc0b)
                                                 #9  0x00007f0e4babc21a _ZN10__cxxabiv111__terminateEPFvvE (libstdc++.so.6 + 0xbc21a)
                                                 #10 0x00007f0e4babc285 _ZSt9terminatev (libstdc++.so.6 + 0xbc285)
                                                 #11 0x00007f0e4babc4d7 __cxa_throw (libstdc++.so.6 + 0xbc4d7)
                                                 #12 0x0000000000464f84 _Z10throwErrorRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold (.Hyprland-wrapped + 0x64f84)
                                                 #13 0x00000000004b854d _ZN11CCompositor10initServerEv (.Hyprland-wrapped + 0xb854d)
                                                 #14 0x000000000048e985 main (.Hyprland-wrapped + 0x8e985)
                                                 #15 0x00007f0e4b75d0ce __libc_start_call_main (libc.so.6 + 0x280ce)
                                                 #16 0x00007f0e4b75d189 __libc_start_main@@GLIBC_2.34 (libc.so.6 + 0x28189)
                                                 #17 0x00000000004a43c5 _start (.Hyprland-wrapped + 0xa43c5)

                                                 Stack trace of thread 1242:
                                                 #0  0x00007f0e4b7bce6e __futex_abstimed_wait_common (libc.so.6 + 0x87e6e)
                                                 #1  0x00007f0e4b7bf6d0 pthread_cond_wait@@GLIBC_2.3.2 (libc.so.6 + 0x8a6d0)
                                                 #2  0x000000000059a37d _ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJZN9CWatchdogC4EvEUlvE_EEEEE6_M_runEv (.Hyprland-wrapped + 0x19a37d)
                                                 #3  0x00007f0e4bae8683 execute_native_thread_routine (libstdc++.so.6 + 0xe8683)
                                                 #4  0x00007f0e4b7c0333 start_thread (libc.so.6 + 0x8b333)
                                                 #5  0x00007f0e4b842efc __clone3 (libc.so.6 + 0x10defc)
                                                 ELF object binary architecture: AMD x86-64
```

* https://github.com/hyprwm/Hyprland/issues/3978


?
* https://github.com/hyprwm/Hyprland/issues/3978

cat /tmp/hypr/$(ls -t /tmp/hypr/ | head -n 1)/hyprland.log
cat /tmp/hypr/$(ls -t /tmp/hypr/ | head -n 2 | tail -n 1)/hyprland.log

```
[LOG] Creating the ConfigManager!
[LOG] NOTE: further logs to stdout / logfile are disabled by default. Use debug:disable_logs and debug:enable_stdout_logs to override this.
```
* https://wiki.hyprland.org/Useful-Utilities/Hyprland-desktop-portal/
* https://github.com/hyprwm/xdg-desktop-portal-hyprland/issues/141

## diagnostics

systemd-cat --identifier hyprland Hyprland

for running hyprland
hyprctl systeminfo
