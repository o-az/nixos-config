{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nvim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    helix.url = "github:helix-editor/helix";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nvim-nightly-overlay, nix-index-database, ... }:
    let
      mkNixos = import ./nixos.nix;
      user = "omar";
      system = "aarch64-linux";
    in {
      nixosConfigurations = {
        vm-orb =
          mkNixos "vm-orb" { inherit user inputs nixpkgs home-manager system nix-index-database; };
      };
    };
}
