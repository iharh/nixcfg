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

## my steps

cat .config/sops/age/keys.txt
copy to target host
...
ls -la /run/secrets
    -> /run/secrets.d/1/

?
sops.secrets.gh-token.owner = "hello-world";
services.cleanup = {
  enable = true;
  tokenFile = config.sops.secrets.gh-token.path;
  profiles.hello-world = {
    repo = "hello-world-app";
    user = "hewllo-world";
  };
};

sops.secrets.gh_token = {
  sopsFile = ../../secrets/github.yaml ;
  path = "%r/gh-token" ;
  owner = dave.name ;
  group = dave.group ;
};

home-manager

ls -l $XDG_RUNTIME_DIR/secrets/

programs.bash.initExtra = ''
  export GITHUB_TOKEN=$(cat /$XDG_RUNTIME_DIR/secrets/gh_token)
'';
