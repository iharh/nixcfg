# comment just for correct highlighting in a SpaceVim
{
  description = "iharh nix config";

  inputs = {
    # -22.11
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    # home-manager.url = "github:nix-community/home-manager";
    # home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    #     https://github.com/Misterio77/nix-colors
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { nixpkgs, ... }@inputs: {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    # !!!
    # https://github.com/notusknot/dotfiles-nix/blob/main/flake.nix
    # https://github.com/notusknot/dotfiles-nix/blob/main/modules/system/configuration.nix
    #
    # https://github.com/Misterio77/nix-starter-configs/blob/main/minimal/flake.nix
    # https://github.com/Misterio77/nix-starter-configs/blob/main/minimal/nixos/configuration.nix
    nixosConfigurations = {
      # TODO: find man for "nixpkgs.lib.nixosSystem"
      ih-nixos = nixpkgs.lib.nixosSystem {
        # TODO replace by enum from flake-utils
        system = "x86_64-linux"; 

        # Pass flake inputs to our config
        specialArgs = { inherit inputs; }; 

        # > Our main nixos configuration file <
        modules = [
          ./hw/kvm-x86_64-linux.nix
        ];
      };
    };
  };
}
