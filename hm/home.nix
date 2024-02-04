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

    };

    packages = with pkgs; [
      hello
      tree
    ];

    # ~/.nix-profile -> .local/state/nix/profiles/profile
    # profile-<N>-link/
    # etc/profile.d/
    # hm-session-vars.sh
    # cat ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    # https://github.com/nix-community/home-manager/blob/master/modules/home-environment.nix
    # https://github.com/nix-community/home-manager/blob/223e3c38a13fb45726c7a9d97e2612ae53ab4f98/modules/programs/bash.nix#L199
    # https://github.com/nix-community/home-manager/blob/master/modules/programs/bash.nix#L211

    sessionVariables = {
      MY_HM_VAR = "my-hm-val";
      EDITOR = "nvim";
    };
  };
}
