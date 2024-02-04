{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gitMinimal
    gh
    vim
    neovim
    wget
  ];
}
