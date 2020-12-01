{ pkgs, nixpkgs, ...}:
{
  # for corefonts and other such stuff
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     curl
     git
     wget

     home-manager

     fd
     ripgrep
     tree

     firefox

     kitty

     vim
     zsh
     zsh-powerlevel10k

     # awesome
     #lua5_2
     #(lua5_2.withPackages(ps: with ps; [ lgi vicious ]))
   ];
}
