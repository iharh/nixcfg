{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager }:
  let
    nixFlakesModule = { pkgs, lib, config, ... }: {
      nix = {
        #package = pkgs.nixFlakes;
        #extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes)
        #  "experimental-features = nix-command flakes";
        registry = {
          nixpkgs.flake = nixpkgs;
        };
      };

      # Define your hostname and 
      networking.hostName = "ihvbox"; 

      # Set your time zone.
      time.timeZone = "Europe/Minsk";

      fonts = {
    	fontDir.enable = true;
      };
    };
  in {
    nixosConfigurations = {
      # var name should be the hostname here
      ihvbox = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        modules = [
          nixFlakesModule
          ./hosts/ihvbox/hardware-configuration.nix
          ./cfg/nix.nix
          ./cfg/networking.nix
          ./cfg/boot.nix
          ./cfg/i18n.nix
          ./cfg/fonts.nix
          ./cfg/syspkgs.nix
          ./cfg/services.nix
          ./cfg/users.nix
          ./cfg/state2009.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            #home-manager.users.user = import ./home.nix;
            home-manager.users.iharh = import ./iharh.nix;
          }
        ];
      };
    };
  };
}
