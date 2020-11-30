# configuration.nix(5) man page
# NixOS manual (accessible by running ‘nixos-help’).

{ config, nixpkgs, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hosts/ihvbox/hardware-configuration.nix
      ./cfg/nix.nix
      ./cfg/fonts.nix
      ./cfg/networking.nix
      ./cfg/boot.nix
      ./cfg/i18n.nix
      ./cfg/syspkgs.nix
      ./cfg/services.nix
      ./cfg/users.nix
      ./cfg/state2009.nix
    ];

  # Define your hostname.
  networking.hostName = "ihvbox"; 

  # Set your time zone.
  time.timeZone = "Europe/Minsk";

  fonts = {
    enableFontDir = true;
  };

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
