{ ... }:

{
  boot = {
    loader = {
      timeout = 60;
      
      efi.canTouchEfiVariables = true;

      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        copyKernels = true;
      };
    };
  };
}
