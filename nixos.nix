name:
{
  user,
  inputs,
  nixvim,
  system,
  nixpkgs,
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
    # home-manager
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.omar = {
          imports = [
            { home.stateVersion = "23.05"; }
            inputs.nixvim.homeManagerModules.nixvim
            ./home-modules/fish
            ./home-modules/helix
            ./home-modules/neovim
            ./home-modules/bat.nix
            ./home-modules/git.nix
            ./home-modules/direnv.nix
            ./home-modules/ghostty.nix
            ./home-modules/keybase.nix
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
          pkgs = import inputs.nixpkgs {
            inherit system;
            allowBroken = true;
            config.allowUnfree = true;
          };
          inherit inputs;
          inherit overlays;
        };
      };
    }

    # Arguments exposed to each module
    {
      config._module.args = {
        currentSystemName = name;
        currentSystem = system;
        # pkgs = import inputs.nixpkgs {
        #   inherit system;
        #   allowBroken = true;
        #   config.allowUnfree = true;
        # };
      };
    }
  ];
}
