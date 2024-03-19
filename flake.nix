{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-utils.url = "github:numtide/flake-utils";
    helix.url = "github:helix-editor/helix";
    nvim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager,nixpkgs-unstable, flake-utils, ... }:
    let
      mkNixos = import ./nixos.nix;
      user = "omar";
      system = "aarch64-linux";
    in {
      nixosConfigurations = {
        vm-orb = mkNixos "vm-orb" { inherit user inputs nixpkgs home-manager system; };
      };
    };
}
