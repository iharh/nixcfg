# libvirt

https://libvirt.org/

## doc

https://libvirt.org/docs.html
https://libvirt.org/manpages/index.html

## src

https://gitlab.com/libvirt/libvirt

## logging

https://libvirt.org/logging.html
https://libvirt.org/kbase/debuglogs.html

## virsh

https://libvirt.org/manpages/virsh.html

## go sdk

https://libvirt.org/golang.html

https://libvirt.org/go/libvirt.html
https://pkg.go.dev/libvirt.org/go/libvirt

https://libvirt.org/go/libvirtxml.html
https://pkg.go.dev/libvirt.org/go/libvirtxml

## py sdk

https://libvirt.org/python.html

https://gitlab.com/libvirt/libvirt-python

## java sdk

https://java.libvirt.org/
https://java.libvirt.org/javadoc/

https://gitlab.com/libvirt/libvirt-java/

https://java.libvirt.org/downloads.html
https://download.libvirt.org/java/
https://download.libvirt.org/maven2/

# tools

https://libvirt.org/manpages/index.html

## virsh

https://libvirt.org/manpages/virsh.html

## qemu-system-x86_64

TBD

https://github.com/virt-manager/virt-manager/tree/main/virtinst
https://github.com/virt-manager/virt-manager/blob/main/virtinst/virtinstall.py

https://that.guru/blog/uefi-secure-boot-in-libvirt/
    virsh dumpxml alpinelinux-q35-uefi-experiment | xmllint --xpath '//os'
https://unix.stackexchange.com/questions/612813/virt-manager-change-firmware-after-installation
https://ru.linux-console.net/?p=3249
    ! all the info is at .efi-file at esp-partition
https://wiki.debian.org/SecureBoot/VirtualMachine
    /usr/share/OVMF/OVMF_CODE_4M.ms.fd
https://github.com/virt-manager/virt-manager/issues/216
    --machine q35
    --boot uefi,loader=/usr/share/edk2/ovmf/OVMF_CODE.secboot.fd,loader_ro=yes,loader_type=pflash,nvram_template=/usr/share/edk2/ovmf/OVMF_VARS.secboot.fd,loader_secure=yes

## ovmf

https://manjaro.ru/manjaro-xfce-edition/qemu-kvm-virt-manager-ovmf.html

## SecureBoot

https://ubs_csse.gitlab.io/secu_os/tutorials/virtual_env.html

https://discuss.linuxcontainers.org/t/lxd-3-21-vm-efi-boot-error/6917
FS0:\> \efi\boot\bootx64.efi
    Command Error Status: Access Denied

security.secureboot=false

https://andreaskaris.github.io/blog/linux/libvirt-uefi-without-secureboot/
https://bbs.archlinux.org/viewtopic.php?id=275691
https://wiki.archlinux.org/title/QEMU#VM_does_not_boot_when_using_a_Secure_Boot_enabled_OVMF

https://github.com/virt-manager/virt-manager/blob/main/virtinst/guest.py#L555
https://github.com/virt-manager/virt-manager/blob/main/virtinst/guest.py#L591
    log.debug("Setting default UEFI path=%s", path)
https://github.com/virt-manager/virt-manager/blob/main/virtinst/guest.py#L846
    _lookup_default_uefi_path
        ...
        path = domcaps.find_uefi_path_for_arch()
https://github.com/virt-manager/virt-manager/blob/main/virtinst/domcapabilities.py#L296
    find_uefi_path_for_arch

https://libvirt.org/kbase/secureboot.html
    <os firmware='efi'>
      <firmware>
        <feature enabled='no' name='secure-boot'/>
      </firmware>
    </os>
    ... the NVRAM file associated with the VM has to be regenerated from its template as well.
    virsh start vm --reset-nvram

https://github.com/virt-manager/virt-manager/blob/main/man/virt-install.rst
    --boot uefi,firmware.feature0.name=secure-boot,firmware.feature0.enabled=no
## grub-install

https://bbs.archlinux.org/viewtopic.php?id=264954

