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

## virt-install

https://linux.die.net/man/1/virt-install
https://github.com/virt-manager/virt-manager/
https://github.com/virt-manager/virt-manager/blob/main/man/virt-install.rst#--boot
https://github.com/virt-manager/virt-manager/blob/main/virtinst/cli.py#L2731
    # --boot parsing #
https://github.com/virt-manager/virt-manager/blob/main/virtinst/cli.py#L2830

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
