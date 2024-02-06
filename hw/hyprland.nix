{ pkgs, lib, inputs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager = {
      sddm.enable = true;
      defaultSession = "sddm";
    };
  };

  programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  # https://discourse.nixos.org/t/wayland-using-home-manager/32357

  #wayland.windowManager.hyprland = {
  #  enable = true;

  #  settings = {
  #    # exec-once = ''${startupScript}/bin/start'';
  #  };
  #};
}
