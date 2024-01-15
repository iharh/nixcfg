{
  description = "iharh nix config";

  inputs = {
    # -22.11
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, disko, ... }@inputs: {
    nixosConfigurations = {
      ih-nixos = nixpkgs.lib.nixosSystem {
        # TODO replace by enum from flake-utils
        system = "x86_64-linux"; 
        # Pass flake inputs to our config
        specialArgs = { inherit inputs; }; 
        modules = [
          disko.nixosModules.disko
          (import ./disks.nix { })
          # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/profiles/qemu-guest.nix
          <nixpkgs/nixos/modules/profiles/qemu-guest.nix>
          ./hw/kvm-x86_64-linux.nix
        ];
      };
    };
  };
}
