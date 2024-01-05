{
  description = "github/o-az nixos-config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations = {
      vm-orb = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./modules/configuration.nix
          ./modules/orbstack.nix
          ./modules/users.nix
          ./modules/nix.nix
          ./modules/fonts.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.omar = {
                imports = [
                  { home.stateVersion = "23.05"; }
                  ./home-modules/helix.nix
                  ./home-modules/git.nix
                  ./home-modules/direnv.nix
                  ./home-modules/fish.nix
                ];
              };
            };
          }
        ];
      };
    };
  };
}
