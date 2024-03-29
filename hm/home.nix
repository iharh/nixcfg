{ config, pkgs, stateVersion, ... }:

{
  programs = {
    home-manager.enable = true;
    # >> ~/.profile
    # "~/.nix-profile/etc/profile.d/hm-session-vars.sh"
    bash.enable = true;
  };

  home = {
    # TODO: parameterize
    username = "iharh";
    homeDirectory = "/home/iharh";

    stateVersion = stateVersion;

    file = {
      "my.conf".text = ''
        #my conf
      '';
    };

    packages = with pkgs; [
      sops

      hello
      tree
      htop
    ];

    # set to the file
    # "~/.nix-profile/etc/profile.d/hm-session-vars.sh"
    sessionVariables = {
      MY_HM_VAR = "my-hm-val";
      EDITOR = "nvim";
      # /$XDG_RUNTIME_DIR/secrets/gh_token
      GH_TOKEN = "$(cat /run/secrets/gh_token)";
    };
  };

  wayland.windowManager = {
    sway = {
      enable = true;
      config = rec {
        modifier = "Mod4";
        # "kitty" "alacritty" "foot"
        terminal = "foot"; 
        # startup = [
        #  # Launch Firefox on start
        #  { command = "firefox"; }
        # ];
      };
    };
    #hyprland = {
    # eanbled = true;
    # settings = {
    #  "$mod" = "SUPER";
    #  bind =
    #    [
    #      "$mod, F, exec, firefox"
    #      ", Print, exec, grimblast copy area"
    #    ]
    #    ++ (
    #      # workspaces
    #      # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
    #      builtins.concatLists (builtins.genList (
    #          x: let
    #            ws = let
    #              c = (x + 1) / 10;
    #            in
    #              builtins.toString (x + 1 - (c * 10));
    #          in [
    #            "$mod, ${ws}, workspace, ${toString (x + 1)}"
    #            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
    #          ]
    #        )
    #        10)
    #    );
    #};
    #};
  };
}
