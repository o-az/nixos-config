name:
{ inputs, nixpkgs, home-manager, system, user }:

nixpkgs.lib.nixosSystem rec {
  inherit system;

  # NixOS System level modules
  modules = [
    ./modules/configuration.nix
    ./modules/orbstack.nix
    ./modules/keybase.nix
    ./modules/nixpkgs.nix
    ./modules/users.nix
    ./modules/fonts.nix
    ./modules/nix.nix
    # home-manager
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.omar = {
          imports = [
            { home.stateVersion = "23.05"; }
            ./home-modules/fish
            ./home-modules/neovim
            ./home-modules/bat.nix
            ./home-modules/git.nix
            ./home-modules/helix.nix
            ./home-modules/direnv.nix
            ./home-modules/starship.nix
            # https://github.com/nix-community/nix-index-database
            inputs.nix-index-database.hmModules.nix-index
            { programs.nix-index-database.comma.enable = true; }
          ];
        };
        # Arguments exposed to each home-module
        extraSpecialArgs = {
          currentSystem = system;
          currentSystemName = name;
          pkgs-unstable = import inputs.nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
          inherit inputs;
        };
      };
    }

    # Arguments exposed to each module
    {
      config._module.args = {
        currentSystemName = name;
        currentSystem = system;
        pkgs-unstable = import inputs.nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;

        };
      };
    }
  ];
}
