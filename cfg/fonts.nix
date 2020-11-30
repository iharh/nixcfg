{ config, pkgs, ... }:
{
  fonts = {
    # enableFontDir = true;
    # fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      hack-font
      font-awesome
    ];
  };
}
