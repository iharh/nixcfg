# modules

## check

```
if [ -d /sys/module/nvidia ] && [ ! -d /sys/module/amdgpu ] && [ ! -d /sys/module/i915 ]; then
```

## kvm

```
Feb 17 16:21:19 ih-nixos systemd[1]: Inserted module 'autofs4'
Feb 17 16:21:19 ih-nixos systemd-modules-load[447]: Inserted module 'kvm_amd'
Feb 17 16:21:20 ih-nixos systemd-modules-load[447]: Inserted module 'amdgpu'
Feb 17 16:21:20 ih-nixos systemd-modules-load[447]: Inserted module 'bridge'
Feb 17 16:21:20 ih-nixos systemd-modules-load[447]: Inserted module 'macvlan'
Feb 17 16:21:20 ih-nixos systemd-modules-load[447]: Inserted module 'tap'
Feb 17 16:21:20 ih-nixos systemd-modules-load[447]: Inserted module 'tun'
Feb 17 16:21:20 ih-nixos systemd-modules-load[447]: Inserted module 'loop'
```
