{
  description = "iharh nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # -22.11

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, disko, ... }@inputs: 
    let
      # TODO replace by enum from flake-utils
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      qemu-module = 
        { modulesPath, ... }: {
          imports = [
            # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/profiles/qemu-guest.nix
            "${modulesPath}/profiles/qemu-guest.nix"
            # "${modulesPath}/virtualisation/qemu-vm.nix"
          ];
          # virtualisation.graphics = false;
          # virtualisation.forwardPorts = [{ from = "host"; host.port = 2022; guest.port = 22; }];
        };
    in {
      nixosConfigurations = {
        ih-nixos = nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit inputs system ;
            stateVersion = "23.11";
            myuser = "iharh"
          }; 
          modules = [
            disko.nixosModules.disko
            (import ./disks.nix { })

            qemu-module
            inputs.sops-nix.nixosModules.sops
            inputs.hyprland.nixosModules.default
            inputs.home-manager.nixosModules.default

            ./hw/experimental-features.nix
            ./hw/boot-common.nix
            ./hw/boot-systemd.nix
            ./hw/system-packages.nix
            ./hw/users.nix
            ./hw/networking.nix

            #./hw/xserver.nix
            #./hw/i3.nix

            ./hw/greetd.nix
            #./hw/hyprland.nix
            ./hw/sway.nix

            ./hw/sops.nix

            ./hw/state-version.nix

            ./hw/home-manager.nix
          ];
        };
      };
    };
}
