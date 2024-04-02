{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";
    flake-parts.url = "github:hercules-ci/flake-parts";

    helix.url = "github:helix-editor/helix";
    helix.inputs.nixpkgs.follows = "nixpkgs-unstable";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs =
    inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, nixvim, flake-parts, flake-utils, ... }:
    let
      user = "omar";
      system = "aarch64-linux";
      mkNixos = import ./nixos.nix;
      overlays = [ inputs.neovim-nightly-overlay.overlay ];
    in {
      nixosConfigurations = {
        vm-orb = mkNixos "vm-orb" {
          inherit user inputs nixpkgs nixpkgs-unstable home-manager nixvim overlays system;
        };
      };
    };
}
