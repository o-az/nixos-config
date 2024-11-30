# https://daiderd.com/nix-darwin/manual/index.html
name:
{
  user,
  inputs,
  system,
  nixpkgs,
  ghostty,
  zjstatus,
  overlays,
  catppuccin,
  nix-darwin,
  home-manager,
}:

nix-darwin.lib.darwinSystem rec {
  inherit system;
  modules = [
    ./modules/1password.nix
    ./modules/darwin.nix
    ./modules/fonts.nix
    ./modules/nix.nix
    #
    # home-manager
    #
    home-manager.darwinModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.o = {
          name = "o";
          home = "/Users/o";
          imports = [
            # TODO: check do I need this
            { home.stateVersion = "23.11"; }
            ./home-modules/tmux
            ./home-modules/kitty
            ./home-modules/helix
            ./home-modules/zellij
            ./home-modules/ghostty
            ./home-modules/bat.nix
            ./home-modules/git.nix
            ./home-modules/home.nix
            ./home-modules/fonts.nix
            ./home-modules/direnv.nix
            ./home-modules/shells/bash
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
        pkgs = import inputs.nixpkgs {
          system = "aarch64-darwin";
          allowBroken = true;
          allowUnfree = true;
        };
      };
    }
  ];
  specialArgs = {
    inherit
      inputs
      system
      nixpkgs
      ghostty
      overlays
      ;
  };
  environment = {
    variables = {
      EDITOR = "hx";
    };
  };
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = true;
      upgrade = true;
      autoUpdate = true;
    };
    global.autoUpdate = true;
    masApps = {
      "Bitwarden" = 1352778147;
    };
    casks = [
      "hey"
      "iina"
      "kitty"
      "slack"
      "qview"
      "figma"
      "stats"
      "signal"
      "xcodes"
      "iterm2"
      "gather"
      "cursor"
      "element"
      "xquartz"
      "raycast"
      "obsidian"
      "transmit"
      "qflipper"
      "telegram"
      "orbstack"
      "cleanshot"
      "hiddenbar"
      "parallels"
      "pixelsnap"
      "protonvpn"
      "1password"
      "alacritty"
      "mullvadvpn"
      "knockknock"
      "cheatsheet"
      "appcleaner"
      "charmstone"
      "powershell"
      "proton-mail"
      "proton-pass"
      "zed@preview"
      "transmission"
      "micro-snitch"
      "little-snitch"
      "screen-studio"
      "1password-cli"
      "betterdisplay"
      "brave-browser"
      "beekeeper-studio"
      "eloston-chromium"
      "karabiner-elements"
      "sony-ps-remote-play"
      "git-credential-manager"
      "firefox@developer-edition"
      "visual-studio-code@insiders"
      #
      # TODO: see if existing font config can work with nix-darwin
      #
      # font-monaspace
      # font-open-dyslexic
      # font-ibm-plex-mono
      # font-jetbrains-mono
      # font-hack-nerd-font
      # font-3270-nerd-font
      # font-0xproto-nerd-font
      # font-monaspace-nerd-font
      # font-blex-mono-nerd-font
      # font-fira-code-nerd-font
      # font-jetbrains-mono-nerd-font
    ];
  };
}
