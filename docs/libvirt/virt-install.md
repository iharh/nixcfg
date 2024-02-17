## virt-install

* [virt-install-examples](https://www.golinuxcloud.com/virt-install-examples-kvm-virt-commands-linux/)
* [Creating Guests with virt-install](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-guest_virtual_machine_installation_overview-creating_guests_with_virt_install)
* [nixos-in-libvirt-21](https://www.technicalsourcery.net/posts/nixos-in-libvirt/)
* [ih-libvirt](https://github.com/iharh/notes/blob/main/os/linux/nixos/inst/ih/ih-libvirt.txt)

virt-install
    --osinfo list


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
https://access.redhat.com/documentation/ru-ru/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-guest_virtual_machine_installation_overview-creating_guests_with_virt_install
    virt-install --option=?
