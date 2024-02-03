# Other configurations

Other configurations to check:
* [schromp-nixconfig](https://github.com/schromp/nixconfig)
* [gytis-ivaskevicius](https://github.com/gytis-ivaskevicius/nixfiles)
* [fufexan](https://github.com/fufexan/dotfiles)
* [chvp](https://github.com/chvp/nixos-config)
* [bobbbay](https://github.com/bobbbay/dotfiles)
* [balsoft](https://github.com/balsoft/nixos-config)
* [RicArch97](https://github.com/RicArch97/nixos-config)
* [MatthiasBenaets](https://github.com/MatthiasBenaets/nixos-config)

! with flake-parts !
https://github.com/hercules-ci/flake-parts
    https://github.com/hercules-ci/flake-parts/tree/main/template/default

https://github.com/moni-dz/nix-config
    https://github.com/moni-dz/nix-config/tree/master/modules/parts
https://github.com/fufexan/dotfiles
    https://github.com/fufexan/dotfiles/blob/main/hosts/default.nix


!! other templatized flakes
https://github.com/Misterio77/nix-starter-configs
    git init nixaaa
    cd nixaaa
    nix --extra-experimental-features "nix-command flakes" flake init -t github:misterio77/nix-starter-config#minimal
    ...
    edit flake.nix
    nixos-generate-config --root /mnt
https://github.com/cruel-intentions/devshell-files
    nix develop github:cruel-intentions/devshell-files --build
https://github.com/konradmalik/dotfiles
https://github.com/ivi-vink/flake/blob/master/templates/rust/flake.nix
https://github.com/alex007sirois/nix-config
https://github.com/dojo-developpement-paris/dojo-developpement-paris.github.io/blob/main/2023/12/22/molkky/flake.nix
https://github.com/schromp/nixconfig
https://github.com/schromp/nixconfig/blob/master/flake.nix
    ! ypr, ..
https://github.com/LongerHV/nixos-configuration
https://github.com/colemickens/nixos-flake-example
    ! old, but using nixos-rebuild
    sh <(curl -L https://nixos.org/nix/install) --no-daemon
https://github.com/adfaure/nix_configuration
    ! not templates
https://github.com/dmadisetti/.dots/tree/template
    ! templating via github
    https://github.com/dmadisetti/.dots/blob/template/nix/machines/momento.nix
    https://github.com/dmadisetti/.dots/actions/workflows/iso.yml
https://github.com/MCotocel/nixdots/tree/master/hosts/lithium#installing
https://github.com/chadcat7/crystal
    https://github.com/chadcat7/crystal/blob/main/flake.nix
    ! simple
https://github.com/johnk1917/nixrland
    ! flakes, but no good readme
https://github.com/enchanted-coder/nix-config/blob/main/nixos/configuration.nix
    ! mini
https://github.com/Icy-Thought/Snowflake
https://github.com/justinlime/dotfiles/blob/main/flake.nix
    !!! good abstractions and hyprland

https://github.com/wochap/nix-config/blob/main/modules/amd-cpu.nix

boot.tmp.cleanOnBoot = true;
https://github.com/wochap/nix-config/blob/main/modules/globals.nix
