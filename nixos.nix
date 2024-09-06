name:
{
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
    ./modules/orbstack.nix
    ./modules/nixpkgs.nix
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
            ./home-modules/fish
            ./home-modules/helix
            ./home-modules/zellij
            ./home-modules/ghostty
            ./home-modules/bat.nix
            ./home-modules/git.nix
            ./home-modules/direnv.nix
            ./home-modules/lazygit.nix
            ./home-modules/keybase.nix
            ./home-modules/starship.nix
            ./home-modules/github-cli.nix
          ];
        };
        # Arguments exposed to each home-module
        extraSpecialArgs = {
          pkgs = import inputs.nixpkgs {
            inherit system;
            # allowBroken = true;
            config.allowUnfree = true;
          };
          currentSystem = system;
          currentSystemName = name;
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
        # pkgs = import inputs.nixpkgs { inherit system; config.allowUnfree = true; };
        inherit ghostty;
      };
    }
  ];
}
