{ pkgs, ... }:

{
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  # hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # kvm-intel kvm-amd
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    initrd = {
      availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
      kernelModules = [ ];
    };
  };
}
