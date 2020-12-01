{ pkgs, ... } :
{
  # unit: home-manager-iharh.service

  imports = [
    ./common/awesome.nix
    ./common/kitty.nix
    ./common/zsh.nix
  ];

  # https://github.com/nix-community/home-manager/issues/432
  home.extraOutputsToInstall = [ "man" ];
  programs.man.enable = false;

  programs = {
    home-manager = {
      enable = true;
      # path = "./hm/iharh.nix";
      # path = pkgs.home-manager;
    };
    
    git = {
      enable = true;
      userName = "Ihar Hancharenka";
      userEmail = "iihoncharenko@gmail.com";
      aliases = {
        ci   = "commit -a";
        lgo  = "log --oneline --graph --decorate";
        puso = "push origin HEAD";
        rbi  = "rebase --interactive";
        st   = "status";
      };
    };

    vim = {
      # defaultEditor = true;
    };
  };
}
