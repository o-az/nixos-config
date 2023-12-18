{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      vm-orb = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./modules/configuration.nix
          ./modules/lxd.nix
          ./modules/orbstack.nix
        ];
      };
    };
  };
}
