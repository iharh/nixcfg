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

    packages = [
      pkgs.hello
    ];

    sessionVariables = {
      MY_HM_VAR = "my-hm-val";
    };
  };
}
