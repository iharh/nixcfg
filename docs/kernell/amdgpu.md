# amdgpu

* https://github.com/ROCm/ROCm
* https://github.com/ROCm/ROCm/blob/develop/CHANGELOG.md
* https://rocm.docs.amd.com/en/latest/
* https://rocm.docs.amd.com/en/latest/what-is-rocm.html
* https://rocm.docs.amd.com/en/latest/about/release-notes.html
* https://rocm.docs.amd.com/en/latest/conceptual/cmake-packages.html
* https://rocm.docs.amd.com/projects/radeon/en/latest/index.html
* https://www.amd.com/en/support/kb/release-notes/rn-radpro-lin-16-40

## prerequisites

* https://rocm.docs.amd.com/projects/install-on-linux/en/latest/how-to/prerequisites.html
* https://rocm.docs.amd.com/projects/install-on-linux/en/latest/reference/system-requirements.html

```
uname -srmv
groups
sudo usermod -a -G render,video $LOGNAME
# no render,video at /etc/group

echo 'ADD_EXTRA_GROUPS=1' | sudo tee -a /etc/adduser.conf
echo 'EXTRA_GROUPS=video' | sudo tee -a /etc/adduser.conf
echo 'EXTRA_GROUPS=render' | sudo tee -a /etc/adduser.conf
```

## install with package manager

* https://rocm.docs.amd.com/projects/install-on-linux/en/latest/tutorial/install-overview.html
* https://rocm.docs.amd.com/projects/install-on-linux/en/latest/tutorial/quick-start.html
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

## manual installer

* https://rocm.docs.amd.com/projects/install-on-linux/en/latest/tutorial/quick-start.html#amdgpu-installer

```
sudo apt update
wget https://repo.radeon.com/amdgpu-install/6.0.2/ubuntu/jammy/amdgpu-install_6.0.60002-1_all.deb
sudo apt install ./amdgpu-install_6.0.60002-1_all.deb
sudo amdgpu-install --usecase=graphics,rocm

$ dpkg -L amdgpu-install
/etc/amdgpu-install/amdgpu-setup.conf
    BASEURL=https://repo.radeon.com
    RELEASE=6.0.2
/etc/apt/preferences.d/repo-radeon-pin-600
    Package: *
    Pin: release o=repo.radeon.com
    Pin-Priority: 600
/etc/apt/sources.list.d/amdgpu.list
/etc/apt/sources.list.d/rocm.list
/etc/apt/trusted.gpg.d/rocm-keyring.gpg
/usr/bin/amdgpu-install
/usr/bin/amdgpu-setup
/usr/share/amdgpu-install/amdgpu.list.template
/usr/share/amdgpu-install/orig/amdgpu.list
/usr/share/amdgpu-install/orig/rocm.list
/usr/share/amdgpu-install/rocm.list.template
```

## post install

* https://rocm.docs.amd.com/projects/install-on-linux/en/latest/how-to/native-install/post-install.html

* https://amdgpu-install.readthedocs.io/en/latest/

## rocm problem

```
$ sudo apt install rocm
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 rocm-gdb : Depends: libtinfo5 but it is not installable
            Depends: libncurses5 but it is not installable
            Depends: libpython3.10 but it is not installable or
                     libpython3.8 but it is not installable
E: Unable to correct problems, you have held broken packages.
```

* https://github.com/ROCm/ROCm/issues/1236
* https://www.reddit.com/r/rhinolinux/comments/1atpno3/admgpu_video_driver/

## detection

* https://wiki.archlinux.org/title/Xorg#AMD

```
sudo lspci -v > ~/Downloads/lspci-out.txt

05:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Cezanne [Radeon Vega Series / Radeon Vega Mobile Series] (rev c8) (prog-if 00 [VGA controller])
	Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Cezanne [Radeon Vega Series / Radeon Vega Mobile Series]
	Flags: bus master, fast devsel, latency 0, IRQ 5
	Memory at d0000000 (64-bit, prefetchable) [size=256M]
	Memory at e0000000 (64-bit, prefetchable) [size=2M]
	I/O ports at e000 [size=256]
	Memory at fcc00000 (32-bit, non-prefetchable) [size=512K]
	Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
	Capabilities: [48] Vendor Specific Information: Len=08 <?>
	Capabilities: [50] Power Management version 3
	Capabilities: [64] Express Legacy Endpoint, MSI 00
	Capabilities: [a0] MSI: Enable- Count=1/4 Maskable- 64bit+
	Capabilities: [c0] MSI-X: Enable- Count=4 Masked-
	Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [270] Secondary PCI Express
	Capabilities: [2b0] Address Translation Service (ATS)
	Capabilities: [2c0] Page Request Interface (PRI)
	Capabilities: [2d0] Process Address Space ID (PASID)
	Capabilities: [400] Data Link Feature <?>
	Capabilities: [410] Physical Layer 16.0 GT/s <?>
	Capabilities: [440] Lane Margining at the Receiver <?>
	Kernel modules: amdgpu
...
05:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD] Family 17h (Models 10h-1fh) Platform Security Processor
	Subsystem: Advanced Micro Devices, Inc. [AMD] Family 17h (Models 10h-1fh) Platform Security Processor
	Flags: bus master, fast devsel, latency 0, IRQ 29
	Memory at fcb00000 (32-bit, non-prefetchable) [size=1M]
	Memory at fcc8c000 (32-bit, non-prefetchable) [size=8K]
	Capabilities: [48] Vendor Specific Information: Len=08 <?>
	Capabilities: [50] Power Management version 3
	Capabilities: [64] Express Endpoint, MSI 00
	Capabilities: [a0] MSI: Enable- Count=1/2 Maskable- 64bit+
	Capabilities: [c0] MSI-X: Enable+ Count=2 Masked-
	Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Kernel driver in use: ccp
	Kernel modules: ccp
```

```
lsmod | grep amd

edac_mce_amd AMD MCE Decoder
gpio_amdpt AMD Promontory GPIO Driver
amdxcp AMD XCP PLATFORM DEVICES

# after installing driver
amddrm_ttm_helper
amdttm
amddrm_buddy
amdxcp
amd_sched
amdkcl
```

## journal problems

* https://www.reddit.com/r/linuxquestions/comments/qu8n5d/error_installing_amd_rocm/

```
systemd-udevd[xxx]: /etc/udev/rules.d/70-amdgpu.rules:1 Invalid operator for GROUP

$ cat /etc/udev/rules.d/70-amdgpu.rules
KERNEL=="kfd", GROUP=="video", MODE="0660"
=>
KERNEL=="kfd", GROUP="video", MODE="0660"
```

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

## kvm/qemu driver passthrough

* https://www.youtube.com/watch?v=ID3dlVHDl0c

## misc

* https://gitlab.com/Oglo12/rebos-config/-/blob/main/imports/gpu_drivers/amd.toml
* https://www.reddit.com/r/NixOS/comments/1b92uwo/am_i_adding_modularity_the_right_way/
