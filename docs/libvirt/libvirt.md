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

## virt-install

* [virt-install-examples](https://www.golinuxcloud.com/virt-install-examples-kvm-virt-commands-linux/)
* [Creating Guests with virt-install](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-guest_virtual_machine_installation_overview-creating_guests_with_virt_install)
* [nixos-in-libvirt-21](https://www.technicalsourcery.net/posts/nixos-in-libvirt/)
* [ih-libvirt](https://github.com/iharh/notes/blob/main/os/linux/nixos/inst/ih/ih-libvirt.txt)

https://linux.die.net/man/1/virt-install
https://github.com/virt-manager/virt-manager/
https://github.com/virt-manager/virt-manager/blob/main/man/virt-install.rst#--boot
https://github.com/virt-manager/virt-manager/blob/main/virtinst/cli.py#L2731
    # --boot parsing #
https://github.com/virt-manager/virt-manager/blob/main/virtinst/cli.py#L2830
https://github.com/virt-manager/virt-manager/blob/main/virtinst/cli.py#L4841
    run_all_parsers
https://github.com/virt-manager/virt-manager/blob/main/virtinst/virtinstall.py#L648
    build_guest_instance
https://github.com/virt-manager/virt-manager/blob/main/virtinst/virtinstall.py#L944
    start_install
https://github.com/virt-manager/virt-manager/blob/main/virtinst/install/installer.py#L692
    start_install
https://github.com/virt-manager/virt-manager/blob/main/virtinst/virtinstall.py#L1191
    main
        ...
        guest, installer = build_guest_instance(conn, options)
            if options.xmlonly or options.dry:
                xml = xml_to_print(guest, installer, options.xmlonly, options.dry)
                if xml:
                    print_stdout(xml, do_force=True)
            else:
                start_install(guest, installer, options)

https://docs.virtuozzo.com/virtuozzo_hybrid_server_7_users_guide/advanced-tasks/creating-virtual-environments-with-virt-install.html
    --disk 'path=/vz/mywindowsvm/harddisk.hdd,bus=scsi,startup_policy=optional,boot_order=1,size=64' \
    --disk 'device=cdrom,path=myosdistrib.iso,bus=scsi,boot_order=2' \

```python
#!/usr/bin/python3

import os
import sys
sys.path.insert(0, "/usr/share/virt-manager")
from virtinst import virtinstall

virtinstall.runcli()

```
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

