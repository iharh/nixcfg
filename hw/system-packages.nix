{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gitMinimal
    gh
    vim
    neovim
    wget
    alacritty # gpu accelerated terminal
    kitty
    foot
  ];
}
