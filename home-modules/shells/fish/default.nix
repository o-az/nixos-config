#
# available home-manager options:
# https://home-manager-options.extranix.com/?query=programs.fish&release=master
#
# fish plugins available in nixpkgs:
# https://search.nixos.org/packages?channel=unstable&from=0&size=500&sort=relevance&type=packages&query=fishPlugins.
#
{ pkgs, lib, ... }:

let
  fishFunctionsDir = ./functions;
  fishFunctionFiles = builtins.filter (f: f != "br.fish") (
    builtins.attrNames (builtins.readDir fishFunctionsDir)
  );
  fishFunctionsConfig = builtins.listToAttrs (
    map (f: {
      name = "fish/functions/${f}";
      value = {
        source = fishFunctionsDir + "/${f}";
      };
    }) fishFunctionFiles
  );

  inherit (pkgs.stdenv) isDarwin;
in
{
  programs = {
    # Note: Fish integrations for fzf, zoxide, eza, dircolors are controlled in home.nix
    # starship and direnv integrations are enabled by default in home-manager

    fish = {
      enable = true;
      package = pkgs.fish;

      # Prefer abbreviations over aliases for better performance
      preferAbbrs = true;

      plugins = with pkgs.fishPlugins; [
        {
          name = "fzf";
          inherit (fzf-fish) src;
        }
        {
          name = "autopair";
          inherit (autopair) src;
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

      # Abbreviations expand inline - faster than functions for simple shortcuts
      shellAbbrs = {
        # Bun
        bb = "bun run build";
        bd = "bun run dev";
        bi = "bun install";
        binc = "bun install --no-cache --force";
        bnl = "bun lint";
        bns = "bun start";
        bnf = "bun format";
        bnt = "bun typecheck";
        bnb = "bun build";

        # PNPM
        pna = "pnpm add";
        pnad = "pnpm add --save-dev";
        pni = "pnpm install";
        pnd = "pnpm dev";
        pnb = "pnpm build";
        pnl = "pnpm lint";
        pns = "pnpm start";
        pnf = "pnpm format";
        pnt = "pnpm typecheck";

        # Yarn
        yad = "yarn add --save-dev";
        yi = "yarn install";
        yd = "yarn dev";
        yb = "yarn build";
        yl = "yarn lint";
        ys = "yarn start";
        yf = "yarn format";
        yt = "yarn typecheck";

        # Git
        cm = "git checkout main";
        rbm = "git rebase origin/main";
        rbc = "git rebase --continue";
        rba = "git rebase --abort";
        gs = "git status";
        ga = "git add . --all";
        gcm = "git commit -S --message";
        gp = "git push";
        gpl = "git pull";
        undo = "git reset --soft HEAD~1";

        # Quick commands
        j = "just";
        f = "fd";
        kp = "ssh keypub.sh";
        ts = "tailscale";
        s = "kitten ssh";
      };

      # Aliases for commands that need special handling (not simple expansions)
      shellAliases = {
        catt = "bat";
        python = "python3";
        zed = "zed-preview";
        superfile = "spf";
        code = "code-insiders";
        gib = "timg";
        zvm = "~/.zvm/self/zvm";
      };

      # Functions that need logic - these are lazy-loaded by fish
      functions = {
        # Modern Unix tool wrappers with custom args
        bat = ''
          command bat --theme='1337' --paging='never' --style='changes,header,grid' $argv
        '';
        ls = ''
          eza --all --color='always' --icons='always' --oneline --git-ignore $argv
        '';
        less = "batpipe $argv";
        diff = "batdiff $argv";
        tree = ''
          eza --all --color='always' --icons='always' --oneline --tree --color-scale=all $argv
        '';

        # Platform-aware bash
        bash = ''
          if test (uname) = Darwin -a -x /opt/homebrew/bin/bash
            /opt/homebrew/bin/bash $argv
          else
            command bash $argv
          end
        '';

        # Git log with formatting
        glog = ''
          git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
        '';

        # Fish greeting (disable)
        fish_greeting = "";
      };

      # Non-interactive shell init (runs for all shells)
      shellInit = ''
        test -d $XDG_CONFIG_HOME || set -gx XDG_CONFIG_HOME ~/.config
        touch $XDG_CONFIG_HOME/.curlrc
        echo > $XDG_CONFIG_HOME/.curlrc "\
        --silent
        --location
        --show-error
        --trace-time"
      '';

      # Interactive shell init - runs only for interactive sessions
      interactiveShellInit =
        let
          envVars = ''
            set -gx XDG_CONFIG_HOME ~/.config
            set -gx LANG en_US.UTF-8
            set -gx NIXPKGS_ALLOW_UNFREE 1
            set -gx FOUNDRY_DISABLE_NIGHTLY_WARNING 1
          '';

          darwinEnv = ''
            set -gx ANDROID_HOME ~/Library/Android/sdk
            set -gx LDFLAGS -L/opt/homebrew/opt/curl/lib
            set -gx CPPFLAGS -I/opt/homebrew/opt/curl/include
            set -gx PKG_CONFIG_PATH /opt/homebrew/opt/curl/lib/pkgconfig
            set -gx PNPM_HOME ~/Library/pnpm
          '';

          linuxEnv = ''
            set -gx ANDROID_HOME ~/Android/Sdk
            set -gx PNPM_HOME ~/.local/share/pnpm
          '';

          pathConfig = ''
            set -gx BUN_INSTALL "$HOME/.bun"
            fish_add_path -g $BUN_INSTALL/bin
            fish_add_path -g ~/.foundry/bin
            fish_add_path -g $PNPM_HOME
            set -gx WASMTIME_HOME "$HOME/.wasmtime"
            fish_add_path -g $WASMTIME_HOME/bin
            set -gx NARGO_HOME ~/.nargo
            fish_add_path -g $NARGO_HOME/bin
            fish_add_path -g ~/.lmstudio/bin
            fish_add_path -g ~/.nix-profile/bin
            fish_add_path -g $HOME/.config/.amp/bin
            fish_add_path -g "$HOME/.tempo/bin"
            fish_add_path -g $HOME/.antigravity/antigravity/bin
            set -gx AMI_INSTALL "$HOME/.ami"
            fish_add_path -g $AMI_INSTALL/bin

            if test -e ~/.nix-profile/etc/profile.d/nix.fish
              source ~/.nix-profile/etc/profile.d/nix.fish
            end
          '';

          toolInit = ''
            if type -q batman
              batman --export-env | source
              set -gx BAT_THEME 1337
            end

            if type -q mise
              mise activate fish | source
            end

            set -gx STARSHIP_SHELL_INTEGRATION_QUERY_TERMINAL 0
          '';

          fzfConfig = ''
            set -g FZF_LEGACY_KEYBINDS 0
            set -gx FZF_FILE_WIDGET_OPTS "--preview 'head {}'"
            set -gx FZF_HISTORY_WIDGET_OPTS '--sort --tac --tiebreak=index --no-sort'
            set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git --color=always'
            set -gx FZF_DEFAULT_OPTS '--height 100% --inline-info --layout=reverse --margin=2,2 --multi'
            set -g fzf_git_log_format '%H %s'
            set -g fzf_history_time_format '%y-%m-%d'
            set -g fzf_diff_highlighter diff-so-fancy

            if type -q fzf_configure_bindings
              fzf_configure_bindings --directory=\cf --processes=\cp --git_log=\cl --git_status=\cs --history=\ch
            end
          '';

          zoxideConfig = ''
            set -g ZOXIDE_ECHO 1
          '';

          forgitConfig = ''
            if set -q FORGIT_INSTALL_DIR
              fish_add_path -g $FORGIT_INSTALL_DIR/bin
              set -gx FORGIT_CHECKOUT_BRANCH_BRANCH_GIT_OPTS '--sort=-committerdate'
            end
          '';

          darwinIntegrations = ''
            test -e ~/.orbstack/shell/init2.fish && source ~/.orbstack/shell/init2.fish 2>/dev/null
            test -e "$HOME/.iterm2_shell_integration.fish" && source "$HOME/.iterm2_shell_integration.fish"
          '';

          ghosttyIntegration = ''
            if set -q GHOSTTY_RESOURCES_DIR
              source "$GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"
            end
          '';

          orbstackAlias = ''
            if uname -r 2>/dev/null | string match -q '*orbstack*'
              alias xdg-open open
            end
          '';

          cursorConfig = ''
            set -g fish_cursor_default block
            set -g fish_cursor_insert 'line blink'
          '';
        in
        envVars
        + (if isDarwin then darwinEnv else linuxEnv)
        + pathConfig
        + toolInit
        + fzfConfig
        + zoxideConfig
        + forgitConfig
        + (if isDarwin then darwinIntegrations else "")
        + ghosttyIntegration
        + orbstackAlias
        + cursorConfig;
    };
  };

  xdg = {
    configFile = {
      "fish/completions".source = ./completions;
      "fish/fish_variables".source = ./fish_variables;
    }
    // fishFunctionsConfig;
  };
}
