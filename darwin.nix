# https://daiderd.com/nix-darwin/manual/index.html
name:
{
  user,
  inputs,
  system,
  nixpkgs,
  ghostty,
  overlays,
  nix-darwin,
  determinate,
  home-manager,
}:

nix-darwin.lib.darwinSystem rec {
  inherit system;
  specialArgs = {
    inherit
      inputs
      system
      nixpkgs
      ghostty
      overlays
      ;
  };
  modules = [
    determinate.darwinModules.default
    # ./modules/1password.nix
    # ./modules/openssh.nix
    ./modules/darwin.nix
    # ./modules/fonts.nix
    ./modules/nix.nix
    {
      homebrew = {
        enable = true;
        onActivation = {
          cleanup = "zap";
          upgrade = true;
          autoUpdate = true;
        };
        global.autoUpdate = true;
        masApps = {
          # "Bitwarden" = 1352778147;
        };
        taps = [
          "homebrew/services"
        ];
        casks = [
          "iina"
          "kitty"
          "qview"
          "stats"
          "gather"
          "signal"
          "alt-tab"
          "anytype"
          "discord"
          "element"
          "raycast"
          "xquartz"
          "orbstack"
          "telegram"
          "transmit"
          "1password"
          "cleanshot"
          "hiddenbar"
          # "parallels"
          "pixelsnap"
          "protonvpn"
          "appcleaner"
          "charmstone"
          "cheatsheet"
          "knockknock"
          "mullvadvpn"
          "pdf-expert"
          "zed@preview"
          "micro-snitch"
          "transmission"
          "betterdisplay"
          "brave-browser"
          "little-snitch"
          "screen-studio"
          "beekeeper-studio"
          "eloston-chromium"
          "karabiner-elements"
          "firefox@developer-edition"
          "visual-studio-code@insiders"

          # TODO: figure out font sharing
          #
          "font-monaspace"
          "font-ibm-plex-mono"
          "font-3270-nerd-font"
          "font-hack-nerd-font"
          "font-jetbrains-mono"
          "font-0xproto-nerd-font"
          "font-blex-mono-nerd-font"
          "font-fira-code-nerd-font"
          "font-monaspace-nerd-font"
          # "font-jetbrains-mono-nerd-font"
        ];
      };
    }
    #
    # home-manager
    #
    home-manager.darwinModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        extraSpecialArgs = {
          currentSystem = system;
          currentSystemName = name;
          pkgs = import inputs.nixpkgs {
            inherit system;
            allowBroken = true;
            config.allowUnfree = true;
          };
          inherit inputs;
        };
        users.o = {
          # name = "o";
          # home = "/Users/o";
          home = {
            username = user;
            homeDirectory = "/Users/o";
          };
          imports = [
            ./home-modules/tmux
            ./home-modules/kitty
            ./home-modules/helix
            ./home-modules/zellij
            ./home-modules/ghostty
            ./home-modules/bat.nix
            ./home-modules/git.nix
            ./home-modules/home.nix
            # ./home-modules/fonts.nix
            ./home-modules/direnv.nix
            ./home-modules/darwin.nix
            # ./home-modules/shells/bash
            ./home-modules/shells/fish
            ./home-modules/lazygit.nix
            ./home-modules/keybase.nix
            ./home-modules/packages.nix
            ./home-modules/starship.nix
            ./home-modules/fastfetch.nix
            ./home-modules/shells/nushell
            ./home-modules/github-cli.nix
          ];
        };
      };
    }
    {
      config._module.args = {
        inherit ghostty;
        pkgs = import inputs.nixpkgs {
          system = "aarch64-darwin";
          allowBroken = true;
          allowUnfree = true;
        };
      };
    }
  ];
}
