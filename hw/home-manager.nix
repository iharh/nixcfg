{ inputs, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      iharh = import ../hm/home.nix;
    };
  };
}
