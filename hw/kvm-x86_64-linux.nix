# config, lib, pkgs
{ lib, pkgs, ... }:

{
  # imports = [];
  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  environment.systemPackages = with pkgs; [
    gitMinimal
    gh
    vim
    neovim
    wget
    tree
  ];

  system.stateVersion = "23.11";
}
