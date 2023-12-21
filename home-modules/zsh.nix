# https://mipmip.github.io/home-manager-option-search/?query=programs.zsh

{ pkgs, ... }:

{

  programs.chromium = {
    enable = true;
  };

  programs.zellij = {
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = "$directory$nix_shell$git_branch$git_state$git_status$jobs$cmd_duration$character";
      #format = "$character";
      character = { success_symbol = "➜"; error_symbol = "✘"; };
    };

  };

  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];

  };

  programs = {
    eza = {
      enable = true;
      git = true;
    };
    fzf = {
      enable = true;
      fileWidgetOptions = [ "--preview 'head {}'" ];
      historyWidgetOptions = [ "--sort" ];
    };
    zoxide.enable = true;
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
      gs = "git status";
      gcm = "git commit -S -m";
      gp = "git push";
      glog = "git log --graph --decorate --pretty=oneline --abbrev-commit";
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

    initExtraBeforeCompInit = ''
    '';

    # https://github.com/thiagokokada/nix-configs/blob/master/home-manager/cli/zsh.nix
    #
    sessionVariables = {
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

}
