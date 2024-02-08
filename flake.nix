{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # helix.url = "github:helix-editor/helix";

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      mkNixos = import ./nixos.nix;
      user = "omar";
      system = "aarch64-linux";
    in {
      nixosConfigurations = {
        vm-orb = mkNixos "vm-orb" {
          inherit user inputs nixpkgs home-manager system;
        };
      };
    };
}
