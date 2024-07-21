name:
{
  user,
  inputs,
  nixvim,
  # ghostty,
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
    # ./modules/tailscale.nix
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
        users.omar = {
          imports = [
            { home.stateVersion = "23.05"; }
            inputs.nixvim.homeManagerModules.nixvim
            ./home-modules/fish
            ./home-modules/helix
            ./home-modules/zellij
            ./home-modules/neovim
            ./home-modules/bat.nix
            ./home-modules/git.nix
            ./home-modules/direnv.nix
            ./home-modules/lazygit.nix
            ./home-modules/ghostty.nix
            ./home-modules/keybase.nix
            ./home-modules/starship.nix
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
      };
    }
  ];
}
