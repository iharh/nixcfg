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

     vim

     firefox
   ];
}
