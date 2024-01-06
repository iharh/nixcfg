# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/profiles/qemu-guest.nix")
    ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  boot = {
    # kvm-intel kvm-amd
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    initrd = {
      availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
      kernelModules = [ ];
    };
    loader = {
      timeout = 60;
      # efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        # "uuid", "label", "provided"
        # !!! fsIdentifier = "provided";

        ## "nodev" for efi only 
        ## /dev/vda
        device = "nodev";
        efiSupport = true;
        # useOSProber = true;
        # efiInstallAsRemovable = true;
        copyKernels = true;
      };
      # Use the systemd-boot EFI boot loader.
      # systemd-boot.enable = true;
    };
  };

  # hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  networking = {
    # TODO: reuse in some way
    hostName = "ih-nixos";

    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    useDHCP = lib.mkDefault true;
    # networking.interfaces.enp1s0.useDHCP = lib.mkDefault true;
  };

  swapDevices = [ ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
      # device = "/dev/disk/by-uuid/c42266c5-b7e9-4d2b-a782-6681d3d1cfc7";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-label/boot";
      # device = "/dev/disk/by-uuid/6DF1-2681";
      fsType = "vfat";
    };
  };

  users.users.iharh = {
    initialPassword = "pwd";
    # ???
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    gitMinimal
    gh
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    wget
  ];

  #console = {
  #  font = "Lat2-Terminus16";
  #  keyMap = "us";
  #  useXkbConfig = true; # use xkb.options in tty.
  #};

  system.stateVersion = "23.11";
}
