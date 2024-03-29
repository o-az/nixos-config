# https://home-manager-options.extranix.com/?query=programs.fish.
# https://search.nixos.org/packages?channel=unstable&from=0&size=500&sort=relevance&type=packages&query=fishPlugins.
{ pkgs-unstable, ... }:

let
  fishFunctionsDirectory = ./functions;
  functionFiles = builtins.readDir fishFunctionsDirectory;

  fishFunctions = builtins.listToAttrs (builtins.map (name:
    let
      functionName = builtins.replaceStrings [ ".fish" ] [ "" ] name;
      functionBody = builtins.readFile "${fishFunctionsDirectory}/${name}";
    in {
      name = functionName;
      value = { body = functionBody; };
    }) (builtins.attrNames functionFiles));
in {
  programs = {
    fish = {
      enable = true;
      package = pkgs-unstable.fish;
      functions = fishFunctions;
      interactiveShellInit = builtins.readFile ./init.fish;
      plugins = with pkgs-unstable.fishPlugins; [
        {
          name = "forgit";
          src = forgit;
        }
        {
          name = "sponge";
          src = sponge.src;
        }
        {
          name = "fzf.fish";
          src = fzf-fish.src;
        }
        {
          name = "autopair.fish";
          src = autopair.src;
        }
        {
          name = "spark.fish";
          src = pkgs-unstable.fetchFromGitHub {
            owner = "jorgebucaran";
            repo = "spark.fish";
            rev = "90a60573ec8a8ecb741a861e0bfca2362f297e5f";
            hash = "sha256-cRSZeqtXSaEKuHeTSk3Kpmwf98mKJ986x1KSxa/HggU=";
          };
        }
        {
          name = "gitnow";
          src = pkgs-unstable.fetchFromGitHub {
            owner = "joseluisq";
            repo = "gitnow";
            rev = "91bda1d0ffad2d68b21a1349f9b55a8cb5b54f35";
            hash = "sha256-PuorwmaZAeG6aNWX4sUTBIE+NMdn1iWeea3rJ2RhqRQ=";
          };
        }
      ];
      shellAliases = {
        walk = "walk --icons";
        cat = "bat --theme='1337' --paging='never' --style='changes,header,grid'";
        rg = "batgrep --color=always --paging='never' --iglob='!*.lock,!*lock.json,!_'";
        grep = "batgrep --color=always --paging='never' --iglob='!*.lock,!*lock.json,!_'";
        man = "BAT_THEME='Solarized (light)' batman";
        less = "batpipe";
        diff = "batdiff";
        find = "fd";
        reload = "exec $SHELL -l";
        vim = "nvim";
        vi = "nvim";
        ".." = "cd ..";
        "..." = "cd ../..";
        tree = "eza --all --color='always' --icons='always' --oneline --git-ignore --tree";
        ls = "eza --all --color='always' --icons='always' --oneline --git-ignore";
        cd = "z";
        dnscheck = "curl https://am.i.mullvad.net/json | jq";
        # https://github.com/antfu/taze
        upall = "bunx taze -r";
        bi = "bun install";
        bd = "bun run dev";
        bb = "bun run build";
        binc = "bun install --no-cache --force";
        myip = "curl http://ipecho.net/plain; echo";
        ga = "git add --all";
        gs = "git status";
        gcm = "git commit -S -m";
        gp = "git push";
        glog =
          "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      };
      shellInit = ''
        touch $XDG_CONFIG_HOME/.curlrc
        echo > $XDG_CONFIG_HOME/.curlrc "\
        --silent
        --location
        --show-error
        --trace-time"
      '';
    };
    nix-index.enableFishIntegration = true;
    eza = {
      git = true;
      enable = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = false;
    };
    broot = {
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
