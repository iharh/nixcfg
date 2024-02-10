# sops-nix

## initial keys transfer

* https://notes.tiredofit.ca/books/linux/page/new-deployment-checklist

Copy output of above ssh-to-age command to /root/.config/sops/age/keys.txt
Make sure file is owned by root:root and can only be read (chmod 400)

* https://github.com/Mic92/sops-nix/tree/master#usage-example

```
5. Deploy
  ...
  # This is using an age key that is expected to already be in the filesystem
  sops.age.keyFile = "/var/lib/sops-nix/key.txt";

```

## samples

* https://discourse.nixos.org/t/gpg-ssh-key-pairs-management/28604/
* https://notes.tiredofit.ca/books/linux/page/secrets-management
* https://www.reddit.com/r/NixOS/comments/mvy86q/how_do_you_manage_your_private_keys/

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
