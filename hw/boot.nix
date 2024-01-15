{ ... }:

{
  boot = {
    loader = {
      timeout = 60;
      
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = true;
        configurationLimit = 10;
        memtest86.enable = true;
      };
      grub = {
        enable = false;
        device = "nodev";
        efiSupport = true;
        copyKernels = true;
      };
    };
  };
}
