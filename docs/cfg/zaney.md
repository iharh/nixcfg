# Zaney config (Tyler Kelley)

https://gitlab.com/Zaney/zaneyos

https://gitlab.com/Zaney/zaneyos/-/blob/main/workstation/configuration.nix
https://gitlab.com/Zaney/zaneyos/-/blob/main/workstation/hardware-configuration.nix
https://gitlab.com/Zaney/zaneyos/-/blob/main/laptop/configuration.nix
https://gitlab.com/Zaney/zaneyos/-/blob/main/laptop/hardware-configuration.nix
    ! luks stuff
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

[Updating My NixOS Flake Live] (https://www.youtube.com/watch?v=FAze1mPeNTQ)