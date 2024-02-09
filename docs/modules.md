# modules

* https://nixos.wiki/wiki/NixOS_modules
* https://discourse.nixos.org/t/import-list-in-configuration-nix-vs-import-function/11372/8
* https://nixos.org/manual/nixos/stable/index.html#sec-modularity
* https://nixos.org/manual/nixos/stable/#sec-writing-modules
* https://nixos.org/manual/nixos/stable/#sec-option-declarations
* https://nixos.wiki/wiki/NixOS:Properties
* https://discourse.nixos.org/t/best-resources-for-learning-about-the-nixos-module-system/1177/4

## modules list

* https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/module-list.nix

## articles

* https://serokell.io/blog/website-deployment-runtime-verification

We utilize webfactory/ssh-agent to setup an SSH agent with the private key provided in secrets.SSH_PRIVATE_KEY

secretsSuffix = if builtins.elem branch [ "master" "develop" ] then serviceSuffix else "-pr";
secrets = "${secretsFolder}/secrets${secretsSuffix}.env";

* https://serokell.io/blog/website-deployment-runtime-verification#server-configuration-1

./servers/hello-world-server.nix:

sops = {
  defaultSopsFile = ../secrets/secrets.yaml;
  age.keyFile = "/var/lib/sops-nix/key.txt";
};

secrets/secrets.yaml:
dns-provider-token: "<TOKEN>"

add to config:
sops.secrets.dns-provider-token = {};

can be referenced:
config.sops.secrets.dns-provider-token.path

* https://github.com/serokell/website-deployment-example/blob/master/website/services.nix
