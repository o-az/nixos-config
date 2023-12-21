# https://mipmip.github.io/home-manager-option-search/?query=programs.zsh

{ pkgs, ... }:

{
  programs.zellij = {
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      character = { success_symbol = "➜"; error_symbol = "✘"; };
    };
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    syntaxHighlighting = {
      enable = true;
    };
    history = {
      size = 100000;
    };
    shellAliases = {
      vi = "hx";
      cat = "bat --style=plain";
      zs = "source ~/.zshrc";
      ".." = "cd ..";
      "..." = "cd ../..";
      ga = "git add --all";
      gcm = "git commit -S -m";
      gp = "git push";
      ls = "eza --oneline --icons --all --group-directories-first --color=auto --sort=modified";
      myip = "curl http://ipecho.net/plain; echo";
      dnscheck = "curl https://am.i.mullvad.net/json | jq";
    };
    enableCompletion = true;
    enableAutosuggestions = true;
    initExtra = ''
      eval "$(starship init zsh)"

      setopt HIST_IGNORE_ALL_DUPS

    '';
    # https://github.com/thiagokokada/nix-configs/blob/master/home-manager/cli/zsh.nix
    #
    sessionVariables = {
      ZIM_HOME = "~/.zim";
      # Enable scroll support
      LESS = "--RAW-CONTROL-CHARS";
      # Reduce time to wait for multi-key sequences
      KEYTIMEOUT = 1;
      # Set right prompt to show time
      RPROMPT = "%F{8}%*";
      # zsh-users config
      ZSH_AUTOSUGGEST_USE_ASYNC = 1;
      ZSH_HIGHLIGHT_HIGHLIGHTERS = [ "main" "brackets" "cursor" ];
      DISABLE_AUTO_TITLE = "true";
      PS1 = " ";
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "'fg=242'";
    };
  };

  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];

  };
}
