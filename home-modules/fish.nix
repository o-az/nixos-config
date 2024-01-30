# https://mipmip.github.io/home-manager-option-search/?query=programs.fish

{ pkgs, ... }:

{
  programs = {
    fish = {
      enable = true;
      plugins = [
        # Enable a plugin (here grc for colorized command output) from nixpkgs
        # https://github.com/pure-fish/pure
        {
          name = "pure";
          src = pkgs.fetchFromGitHub {
            owner = "pure-fish";
            repo = "pure";
            rev = "f1b2c7049de3f5cb45e29c57a6efef005e3d03ff";
            sha256 = "sha256-MnlqKRmMNVp6g9tet8sr5Vd8LmJAbZqLIGoDE5rlu8E=";
          };
        }
        # https://github.com/jorgebucaran/autopair.fish
        {
          name = "autopair.fish";
          src = pkgs.fetchFromGitHub {
            owner = "jorgebucaran";
            repo = "autopair.fish";
            rev = "4d1752ff5b39819ab58d7337c69220342e9de0e2";
            sha256 = "sha256-s1o188TlwpUQEN3X5MxUlD/2CFCpEkWu83U9O+wg3VU=";
          };
        }
      ];
      interactiveShellInit = ''
        if status is-interactive
          # Commands to run in interactive sessions can go here
        end
        set -x LANG en_US.UTF-8
        if test -z (pgrep ssh-agent | string collect)
            eval (ssh-agent -c)
            set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
            set -Ux SSH_AGENT_PID $SSH_AGENT_PID
        end
        function mkcd -d "Create directory and change to it"
          mkdir -pv $argv;
            cd $argv;
        end

        for file in $HOME/nixos-config/home-modules/fish-functions/*.fish
          source $file
        end
      '';
      shellAliases = {
        cat = "bat --theme='1337' --style='numbers,changes'";
        find = "fd";
        reload = "exec $SHELL -l";
        vim = "nvim";
        vi = "nvim";
        ".." = "cd ..";
        "..." = "cd ../..";
        ls = "eza --all --color='always' --icons='always' --oneline --gitignore";
          ga = "git add --all";
      gs = "git status";
      gcm = "git commit -S -m";
      gp = "git push";
      glog =
        "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";

        myip = "curl http://ipecho.net/plain; echo";
        dnscheck = "curl https://am.i.mullvad.net/json | jq";
        hide = "defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder";
        show = "defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder";
        hidedesktop = "defaults write com.apple.finder CreateDesktop -bool false && killall Finder";
        showdesktop = "defaults write com.apple.finder CreateDesktop -bool true && killall Finder";
      };
    };
    chromium = { enable = true; };
    zellij = { enableFishIntegration = true; };
    starship = {
      enable = true;
      enableFishIntegration = true;
      enableTransience = true;
      settings = { };
    };
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
    };
    eza = {
      git = true;
      enable = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
      fileWidgetOptions = [ "--preview 'head {}'" ];
      historyWidgetOptions = [ "--sort" ];
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
