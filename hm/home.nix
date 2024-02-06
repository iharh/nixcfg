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
      "~/my.conf".text = ''
        #my conf
      '';
    };

    packages = with pkgs; [
      hello
      tree
    ];

    # set to the file
    # "~/.nix-profile/etc/profile.d/hm-session-vars.sh"
    sessionVariables = {
      MY_HM_VAR = "my-hm-val";
      EDITOR = "nvim";
    };
  };
}
