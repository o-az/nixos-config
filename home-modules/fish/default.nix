# https://home-manager-options.extranix.com/?query=programs.fish.
# https://search.nixos.org/packages?channel=unstable&from=0&size=500&sort=relevance&type=packages&query=fishPlugins.
{ pkgs, ... }:

let
  fishFunctionsDirectory = ./functions;
  functionFiles = builtins.readDir fishFunctionsDirectory;
  fishFunctions = builtins.listToAttrs (
    builtins.map (
      name:
      let
        functionName = builtins.replaceStrings [ ".fish" ] [ "" ] name;
        functionBody = builtins.readFile "${fishFunctionsDirectory}/${name}";
      in
      {
        name = functionName;
        value.body = functionBody;
      }
    ) (builtins.attrNames functionFiles)
  );
in
{
  programs = {
    fish = {
      enable = true;
      package = pkgs.fish;
      functions = fishFunctions;
      interactiveShellInit = builtins.readFile ./init.fish;
      plugins = with pkgs.fishPlugins; [
        {
          name = "sponge";
          src = sponge.src;
        }
        {
          name = "fzf";
          src = fzf-fish.src;
        }
        {
          name = "autopair";
          src = autopair.src;
        }
        {
          name = "spark";
          src = pkgs.fetchFromGitHub {
            owner = "jorgebucaran";
            repo = "spark.fish";
            rev = "90a60573ec8a8ecb741a861e0bfca2362f297e5f";
            hash = "sha256-cRSZeqtXSaEKuHeTSk3Kpmwf98mKJ986x1KSxa/HggU=";
          };
        }
      ];
      shellAliases = {
        j = "just";
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
        yless = "jless --yaml";
        tree = "eza --all --color='always' --icons='always' --oneline --git-ignore --tree";
        ls = "eza --all --color='always' --icons='always' --oneline --git-ignore";
        dnscheck = "curl https://am.i.mullvad.net/json | jq";
        # https://github.com/antfu/taze
        upall = "bunx taze -r";
        bi = "bun install";
        bd = "bun run dev";
        bb = "bun run build";
        binc = "bun install --no-cache --force";
        pna = "pnpm add";
        pnad = "pnpm add --save-dev";
        pnb = "pnpm build";
        pnc = "pnpm clean";
        pnd = "pnpm dev";
        pns = "pnpm start";
        pnf = "pnpm format";
        pni = "pnpm install";
        pnl = "pnpm lint";
        pnt = "pnpm typecheck";
        myip = "curl http://ipecho.net/plain; echo";
        ga = "git add --all";
        gs = "git status";
        gcm = "git commit -S -m";
        gp = "git push";
        glog = "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
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
      icons = true;
      enable = true;
      package = pkgs.eza;
      enableFishIntegration = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = false;
    };
    broot = {
      enable = true;
      enableFishIntegration = true;
    };
    dircolors = {
      enable = true;
      enableFishIntegration = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
      package = pkgs.zoxide;
    };
  };
}
