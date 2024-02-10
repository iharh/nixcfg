# sops-nix

## samples

* https://discourse.nixos.org/t/gpg-ssh-key-pairs-management/28604/

## konradmalik

* https://konradmalik.com/posts/2023/02/sops-nix-simple-secrets-management-for-nix/
* https://github.com/konradmalik/dotfiles
* https://github.com/konradmalik/dotfiles/blob/main/home/konrad/common/global/ssh-keys.nix
* https://github.com/konradmalik/dotfiles/blob/main/hosts/common/global/openssh.nix
* https://github.com/konradmalik/dotfiles/blob/main/hosts/common/users/konrad/darwin.nix
* https://github.com/konradmalik/dotfiles/blob/main/hosts/common/users/konrad/nixos.nix

* https://github.com/konradmalik/dotfiles/blob/main/home/konrad/common/global/sops.nix

    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";


* ???

path = "/etc/ssh/ssh_host_ed25519_key";
? only one usage

* https://github.com/konradmalik/dotfiles/blob/main/modules/home-manager/ssh-keys.nix

## Misterio77

* https://github.com/Misterio77/nix-config/blob/main/hosts/common/users/misterio/default.nix
