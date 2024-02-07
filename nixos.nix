name:
{ inputs, nixpkgs, home-manager, system, user }:

nixpkgs.lib.nixosSystem rec {
  inherit system;

  # NixOS System level modules
  modules = [
    ./modules/configuration.nix
    ./modules/orbstack.nix
    ./modules/users.nix
    ./modules/fonts.nix
    ./modules/nix.nix
    home-manager.nixosModules.home-manager

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
            ./home-modules/bat.nix
            ./home-modules/git.nix
            ./home-modules/helix.nix
            ./home-modules/direnv.nix
            ./home-modules/starship.nix
          ];
        };
        # Arguments exposed to each home-module
        extraSpecialArgs = {
          currentSystemName = name;
          currentSystem = system;
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
