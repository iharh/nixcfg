{ config, pkgs, lib, ... }:

#let
#  lua = pkgs.luaPackages.lua;
#  lgi = pkgs.luaPackages.lgi;
#  luaVer = lua.luaversion;
#in

{
  services.xserver = {
    enable = true;
    layout = "us";
    # xkbVariant = "altgr-intl";
    # xkbOptions = "caps:escape,compose:menu";
    # libinput.enable = true;

    windowManager = {
      awesome = {
        enable = true;

        #luaModules = with pkgs.luaPackages; [ # lua52Packages lgi is already present
          # luasocket cjson vicious 
        #];
      };
    };

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      defaultSession = "none+awesome";
      # defaultSession = "none+myawesome";

      #session = [ {
      #  name = "myawesome";
      #  manage = "window";
      #  start = ''
      #    ${pkgs.awesome}/bin/awesome --no-argb >> ~/.cache/awesome_stdout 2>> ~/.cache/awesome_stderr &
      #    waitPID=$!
      #  '';
      #} ];

      sddm.enable = true;
      # lightdm.enable = true;
    };
  };
}
