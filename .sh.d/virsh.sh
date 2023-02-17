alias vm-nixos-edit='virsh edit nixos'
alias vm-nixos-dumpxml='virsh dumpxml nixos'
alias vm-nixos-console='virsh console nixos'
alias vm-nixos-start='virsh start nixos'
# ??? destroy --graceful
# virsh pool-list
# Name      State    Autostart
#-------------------------------
# default   active   yes
# dist      active   yes
# images    active   yes
#
# virsh pool-destroy images
#
# virsh vol-list --pool default
#
# sudo rm /var/lib/libvirt/images/nixos.qcow2
# sudo poweroff
# sudo shutdown -h now
alias vm-nixos-shutdown='virsh shutdown nixos'
alias vm-nixos-undefine='virsh undefine nixos'
vm-nixos-install-ui() {
    virt-install -v \
        --name=nixos \
        --connect="qemu:///system" \
        --virt-type=kvm \
        --vcpus=4 \
        --memory=16392 \
        --os-variant=nixos-unstable \
        --network bridge=virbr0,model=virtio \
        --import \
        --livecd \
        --noautoconsole \
        --disk="/var/lib/libvirt/images/nixos.qcow2,size=50,bus=virtio" \
        --cdrom=Downloads/dist/nixos-plasma5-23.05pre451105.06999209d7a-x86_64-linux.iso \
        --boot loader=/usr/share/OVMF/OVMF_CODE.fd
        # --graphics vnc,listen=0.0.0.0 \
        # --hvm
        # --boot=cdrom,hd
        # --boot="uefi,
        # firmware=efi,
        # loader_secure=yes,
        # --network=",mac=${MAC_ADDR}" \
        # --console pty,target_type=virtio \
}
vm-nixos-install-mini() {
    virt-install -v \
        --name=nixos \
        --connect="qemu:///system" \
        --virt-type=kvm \
        --vcpus=4 \
        --memory=16392 \
        --os-variant=nixos-unstable \
        --network bridge=virbr0,model=virtio \
        --import \
        --livecd \
        --disk="/var/lib/libvirt/images/nixos.qcow2,size=50,bus=virtio" \
        --cdrom=Downloads/dist/nixos-minimal-23.05pre454549.545c7a31e5d-x86_64-linux.iso \
        --boot loader=/usr/share/OVMF/OVMF_CODE.fd \
        --console pty,target_type=virtio \
        --nographics
# The "nixos" and "root" accounts have empty passwords.
# An ssh daemon is running. You then must set a password for either "root" or "nixos" with `passwd`
# or add an ssh key to /home/nixos/.ssh/authorized_keys be able to login.
# If you need a wireless connection, type `sudo systemctl start wpa_supplicant` and
# configure a network using `wpa_cli`. See the NixOS manual for details.
# Run 'nixos-help' for the NixOS manual.
# nixos login: nixos (automatic login)
# C-] - to exit

# serial-getty@hvc0.service - enabled (not a ttyS0)
}
vm-nixos-view() {
    virt-manager --connect="qemu:///system" --show-domain-console nixos
    # virt-viewer --domain-name nixos -a
}
# virsh create a.xml
# virt-xml <domain> --edit
# https://manpages.ubuntu.com/manpages/xenial/man1/virt-xml.1.html
#   virt-xml <domain> ...
#   cat a.xml |
#       virt-xml --edit target=vda --disk boot_order=1 --no-define --print-diff
#       virt-xml --edit target=sda --disk boot_order=2 --no-define --print-diff
