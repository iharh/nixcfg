{ pkgs, ... } :
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreDups = true;
    };
    shellAliases = {
      ll  = ''ls -l  --group-directories-first --time-style=+"%d.%m.%Y %H:%M:%S" --color=auto -F'';
      la  = ''ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M:%S" --color=auto -F'';
      l   = "la";
      rst = "reboot";
      off = "poweroff";
      #
      fif = "fd";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "romkatv/powerlevel10k"; }
      ];
    };
    initExtra = ''
      # source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme;
      [[ ! -f ~/.zplug/repos/romkatv/powerlevel10k/powerlevel10k.zsh-theme ]] || source ~/.zplug/repos/romkatv/powerlevel10k/powerlevel10k.zsh-theme

      # [[ ! -f ~/.zplug/repos/romkatv/powerlevel10k/config/p10k-classic.zsh ]] || source ~/.zplug/repos/romkatv/powerlevel10k/config/p10k-classic.zsh
      # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
      [[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh
    '';
  };

  xdg.configFile."zsh" = {
    source = ../config/zsh;
    recursive = true;
  };
}
