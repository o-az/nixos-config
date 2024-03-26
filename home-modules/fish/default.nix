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
      functions = fishFunctions;
      plugins = [
        {
          name = "gitnow";
          src = pkgs-unstable.fetchFromGitHub {
            owner = "joseluisq";
            repo = "gitnow";
            rev = "91bda1d0ffad2d68b21a1349f9b55a8cb5b54f35";
            hash = "sha256-PuorwmaZAeG6aNWX4sUTBIE+NMdn1iWeea3rJ2RhqRQ=";
          };
        }
        {
          name = "fzf.fish";
          src = pkgs-unstable.fetchFromGitHub {
            owner = "patrickf1";
            repo = "fzf.fish";
            rev = "dfdf69369bd3a3c83654261f90363da2aa1db8c9";
            hash = "sha256-x/q7tlMlyxZ1ow2saqjuYn05Z1lPOVc13DZ9exFDWoU=";
          };
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
          name = "fish-async-prompt";
          src = pkgs-unstable.fetchFromGitHub {
            owner = "acomagu";
            repo = "fish-async-prompt";
            rev = "316aa03c875b58e7c7f7d3bc9a78175aa47dbaa8";
            hash = "sha256-J7y3BjqwuEH4zDQe4cWylLn+Vn2Q5pv0XwOSPwhw/Z0=";
          };
        }
        {
          name = "autopair.fish";
          src = pkgs-unstable.fetchFromGitHub {
            owner = "jorgebucaran";
            repo = "autopair.fish";
            rev = "4d1752ff5b39819ab58d7337c69220342e9de0e2";
            hash = "sha256-qt3t1iKRRNuiLWiVoiAYOu+9E7jsyECyIqZJ/oRIT1A=";
          };
        }
        {
          name = "sponge";
          src = pkgs-unstable.fetchFromGitHub {
            owner = "meaningful-ooo";
            repo = "sponge";
            rev = "384299545104d5256648cee9d8b117aaa9a6d7be";
            hash = "sha256-MdcZUDRtNJdiyo2l9o5ma7nAX84xEJbGFhAVhK+Zm1w=";
          };
        }
      ];
      interactiveShellInit = builtins.readFile ./init.fish;
      shellAliases = {
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
        binc = "bun install --no-cache --force";
      };
    };
    eza = {
      git = true;
      enable = true;
    };
    # chromium.enable = true;
    nix-index.enableFishIntegration = true;
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
