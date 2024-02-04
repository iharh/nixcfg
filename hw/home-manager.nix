{ inputs, config, pkgs, stateVersion, ... }:

{
  environment.systemPackages = with pkgs; [
    home-manager
  ];

  home-manager = {
    extraSpecialArgs = { 
      inherit inputs; 
      stateVersion = stateVersion;
    };
    users = {
      iharh = import ../hm/home.nix;
    };
  };
}
