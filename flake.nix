{
  description = "iharh nix config";

  inputs = {
    # -22.11
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  # https://discourse.nixos.org/t/configure-qemu-vm-with-deploy-rs-fails-because-of-grub/32268
  outputs = { nixpkgs, disko, ... }@inputs: 
    let
      # TODO replace by enum from flake-utils
      system = "x86_64-linux";
      # qemu-common = import ../../lib/qemu-common.nix { inherit lib pkgs; };
      qemu-module = 
        { modulesPath, ... }: {
          imports = [
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
            disko.nixosModules.disko
            (import ./disks.nix { })
            # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/profiles/qemu-guest.nix
            # error: cannot look up '<nixpkgs/nixos/modules/profiles/qemu-guest.nix>' in pure evaluation mode (use '--impure' to override)
            <nixpkgs/nixos/modules/profiles/qemu-guest.nix>
            ./hw/kvm-x86_64-linux.nix
          ];
        };
      };
    };
}
