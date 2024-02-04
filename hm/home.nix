{ config, pkgs, stateVersion, ... }:

{
  programs.home-manager.enable = true;

  home = {
    # TODO: parameterize
    username = "iharh";
    homeDirectory = "/home/iharh"

    # TODO: stateVersion = stateVersion;
    stateVersion = "23.11";

    file = {

    };

    packages = {
      pkgs.hello
    };

    sessionVariables = {
      MY_HM_VAR = "my-hm-val";
    }
  };
}
