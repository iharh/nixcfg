{
  description = "iharh nix config";

  inputs = {
    # -22.11
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    # optional, not necessary for the module
    # sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, disko, ... }@inputs: 
    let
      # TODO replace by enum from flake-utils
      system = "x86_64-linux";
      qemu-module = 
        { modulesPath, ... }: {
          imports = [
            # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/profiles/qemu-guest.nix
            "${modulesPath}/profiles/qemu-guest.nix"
            # "${modulesPath}/virtualisation/qemu-vm.nix"
          ];
          # virtualisation.forwardPorts = [{ from = "host"; host.port = 2022; guest.port = 22; }];
          # virtualisation.graphics = false;
        };
    in {
      nixosConfigurations = {
        ih-nixos = nixpkgs.lib.nixosSystem {
          system = system;
          # Pass flake inputs to our config
          specialArgs = { inherit inputs; }; 
          modules = [
            # { config, lib, pkgs, ... }:
            disko.nixosModules.disko
            (import ./disks.nix { })
            qemu-module
            inputs.sops-nix.nixosModules.sops
            inputs.hyprland.nixosModules.default
            ./hw/experimental-features.nix
            ./hw/boot-common.nix
            ./hw/boot-systemd.nix
            ./hw/system-packages.nix
            ./hw/users.nix
            ./hw/networking.nix

            #./hw/xserver.nix
            #./hw/i3.nix
            ./hw/home-manager.nix

            ./hw/display-manager.nix
            ./hw/hyprland.nix

            (import ./hw/state-version.nix { stateVersion = "23.11"; })
            #
          ];
        };
      };
    };
}
