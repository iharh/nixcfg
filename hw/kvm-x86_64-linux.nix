# config, lib, pkgs
{ lib, ... }:

{
  # imports = [];
  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  system.stateVersion = "23.11";
}
