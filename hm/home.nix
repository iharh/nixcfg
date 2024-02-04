{ config, pkgs, stateVersion, ... }:

{
  programs.home-manager.enable = true;

  home = {
    # TODO: parameterize
    username = "iharh";
    homeDirectory = "/home/iharh";

    stateVersion = stateVersion;

    file = {

    };

    packages = with pkgs; [
      hello
      tree
    ];

    sessionVariables = {
      MY_HM_VAR = "my-hm-val";
      EDITOR = "nvim";
    };
  };
}
