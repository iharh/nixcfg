{ pkgs, ... } :
{
  programs.kitty = {
    enable = true;
    # TODO: investigate using just "font" vs "font.name"
    font.name = "Hack";
    keybindings = {
      "shift+down"  = "new_tab";
      "shift+right" = "next_tab";
      "shift+left"  = "previous_tab";
    };

    extraConfig = ''
      font_size 14

      remember_window_size yes
    '';
  };
}
