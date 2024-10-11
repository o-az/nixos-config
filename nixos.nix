name:
{
  nvix,
  user,
  inputs,
  system,
  nixpkgs,
  ghostty,
  overlays,
  home-manager,
}:

nixpkgs.lib.nixosSystem rec {
  inherit system;
  # NixOS System level modules
  modules = [
    { nixpkgs.overlays = overlays; }
    ./modules/configuration.nix
    ./modules/1password.nix
    ./modules/tailscale.nix
    ./modules/orbstack.nix
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
            ./home-modules/home.nix
            ./home-modules/kitty
            ./home-modules/helix
            ./home-modules/zellij
            ./home-modules/ghostty
            ./home-modules/bat.nix
            ./home-modules/git.nix
            # ./home-modules/fonts.nix
            ./home-modules/direnv.nix
            ./home-modules/shells/bash
            ./home-modules/shells/fish
            ./home-modules/lazygit.nix
            ./home-modules/keybase.nix
            ./home-modules/packages.nix
            ./home-modules/starship.nix
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
          inherit nvix;
          inherit inputs;
          inherit ghostty;
          inherit overlays;
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
