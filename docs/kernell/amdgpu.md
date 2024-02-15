# amdgpu

* https://rocm.docs.amd.com/en/latest/what-is-rocm.html
* https://rocm.docs.amd.com/projects/install-on-linux/en/latest/how-to/native-install/ubuntu.html
amdgpu-dkms

```
Setting up grub2-common (2.12-1ubuntu2) ...
Setting up grub-efi-amd64 (2.12-1ubuntu1) ...
Trying to migrate /boot/efi into esp config
Sourcing file `/etc/default/grub'
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-6.5.5-060505-generic
Found initrd image: /boot/initrd.img-6.5.5-060505-generic
Adding boot menu entry for UEFI Firmware Settings ...
done
...
amdgpu.ko.zst:
amdttm.ko.zst:
amdkcl.ko.zst:
amd-sched.ko.zst:
amddrm_ttm_helper.ko.zst:
amddrm_buddy.ko.zst:
amdxcp.ko.zst:
...
Running module version sanity check.
 - Original module
 - Installation
   - Installing to /lib/modules/6.5.5-060505-generic/updates/dkms/
depmod...
update-initramfs: Generating /boot/initrd.img-6.5.5-060505-generic
Processing triggers for man-db (2.12.0-3) ...
```

* https://rocm.docs.amd.com/projects/install-on-linux/en/latest/how-to/native-install/post-install.html

* https://amdgpu-install.readthedocs.io/en/latest/

## usual

* https://askubuntu.com/questions/1432449/how-to-install-amd-gpu-drivers-ubuntu-22-04-lts
* https://askubuntu.com/questions/1417418/unmet-dependencies-ubuntu-22-04-amdgpu-hip-support
* https://askubuntu.com/questions/1433335/no-hdmi-output-for-wayland-bad-output-or-half-screen-for-x11-22-04-and-asus-ry/1433498#1433498

## pro

* https://linuxconfig.org/amd-radeon-ubuntu-20-04-driver-installation
* https://www.amd.com/en/support/kb/faq/gpu-643
* https://www.amd.com/en/support/linux-drivers

## ubuntu-drivers

* https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-22-04
