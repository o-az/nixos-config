# https://mipmip.github.io/home-manager-option-search/?query=programs.fish

{ pkgs, ... }:

{
  programs = {
    fish = {
      enable = true;
      plugins = [
        # https://github.com/jorgebucaran/fisher
        {
          name = "fisher";
          src = pkgs.fetchFromGitHub {
            owner = "jorgebucaran";
            repo = "fisher";
            rev = "2efd33ccd0777ece3f58895a093f32932bd377b6";
            hash = "sha256-e8gIaVbuUzTwKtuMPNXBT5STeddYqQegduWBtURLT3M=";
          };
        }
      ];
      interactiveShellInit = builtins.readFile ./init.fish;
      shellAliases = {
        cat =
          "bat --color='always' theme='1337' --style='changes,header,grid' --line-range :500 {}";
        jq = "jaq";
        find = "fd";
        reload = "exec $SHELL -l";
        vim = "nvim";
        vi = "nvim";
        ".." = "cd ..";
        "..." = "cd ../..";
        tree = "eza --all --color='always' --icons='always' --oneline --git-ignore --tree";
        ls = "eza --all --color='always' --icons='always' --oneline --git-ignore";
        cd = "z";
        ga = "git add --all";
        gs = "git status";
        gcm = "git commit -S -m";
        gp = "git push";
        glog =
          "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
        myip = "curl http://ipecho.net/plain; echo";
        dnscheck = "curl https://am.i.mullvad.net/json | jq";
        # https://github.com/antfu/taze
        upall = "bunx taze -r";
        bi = "bun install";
        bd = "bun run dev";
        bb = "bun run build";
      };
    };
    eza = {
      git = true;
      enable = true;
    };
    chromium = { enable = true; };
    fzf = {
      enable = true;
      enableFishIntegration = false;
    };
    broot = {
      enable = true;
      enableFishIntegration = true;
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
    };
    zellij = {
      enable = true;
      # enabling this will enter zellij when starting fish
      enableFishIntegration = false;
    };
    dircolors = {
      enable = true;
      enableFishIntegration = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
