name:
{
  user,
  inputs,
  system,
  stylix,
  nixpkgs,
  ghostty,
  zjstatus,
  overlays,
  catppuccin,
  determinate,
  home-manager,
}:

nixpkgs.lib.nixosSystem rec {
  inherit system;
  # NixOS System level modules
  modules = [
    determinate.nixosModules.default
    { nixpkgs.overlays = overlays; }
    ./orbstack/configuration.nix
    ./orbstack/orbstack.nix

    ./modules/1password.nix
    ./modules/tailscale.nix
    ./modules/nixpkgs.nix
    ./modules/openssh.nix
    ./modules/xserver.nix
    ./modules/users.nix
    ./modules/fonts.nix
    ./modules/nix.nix
    #
    # home-manager
    #
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.o = {
          imports = [
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
        # Arguments exposed to each home-module
        extraSpecialArgs = {
          currentSystem = system;
          currentSystemName = name;
          pkgs = import inputs.nixpkgs {
            inherit system;
            allowBroken = true;
            config.allowUnfree = true;
          };
          inherit
            inputs
            ghostty
            zjstatus
            overlays
            catppuccin
            ;
        };
      };
    }

    # Arguments exposed to each module
    {
      config._module.args = {
        currentSystem = system;
        currentSystemName = name;
        inherit ghostty;
      };
    }
  ];
}
