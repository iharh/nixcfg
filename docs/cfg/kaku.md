# kaku

* https://github.com/linuxmobile/kaku/
uses flake-parts

* https://github.com/linuxmobile/nvchad-v2
forked from NvChad/example_config

* https://github.com/linuxmobile/kaku/blob/main/hosts/aesthetic/default.nix#L10C4-L10C32
boot.kernelModules = ["amdgpu"];

## Installing kaku

git clone --depth 1 https://github.com/linuxmobile/kaku
nixos-generate-config --force --dir $HOME/kaku/hosts/aesthetic
rm -rf $HOME/kaku/hosts/aesthetic/configuration.nix
cd kaku
sudo nixos-install --flake .#aesthetic
    warning: input 'nh' has an override for a non-existent input 'flake-parts'

    git config --global --add safe.directory /mnt/etc/nixos

    error: hash mismatch in fixed-output derivation '/nix/store/vszqrsf7wylfr1b7akagc5l70idv5v4y-antfu-unocss.zip.drv':
        specified: sha256-diwvMl88Nfq3QPm6AygiQpoFm82hSelpnU5KCOSU0pE=
        got:       sha256-fl7uJFjrCKfQy3YkpttA0N6GRtFsqw82m2w4hQ2xRsE=

    https://github.com/linuxmobile/kaku/blob/main/home/software/vscode.nix

    vim home/software/vscode.nix
    name = "catpuccin-perfect-icons";
    sha256 = "sha256-aTQCIqwBTvd0oARcgAnsp6FQY6R51DqJ/HLgNxsLPjk=";

    name = "copilot-chat";
    sha256 = "sha256-KgwhPK19B+PBFeMhUOtfUtW14QUBc4yMIA80SToqomQ=";
    name = "unocss";
    sha256 = "sha256-fl7uJFjrCKfQy3YkpttA0N6GRtFsqw82m2w4hQ2xRsE=";

    vim pkgs/xwaylandvideobridge/default.nix
    repo = "xwaylandvideobridge";
    hash = "sha256-0HD5++cPvsx+bsdgCzn515KPtS1bj6JTKldxKdWEcKs=";
