{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nvim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    helix.url = "github:helix-editor/helix";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = inputs@{ self, nixpkgs, home-manager, nvim-nightly-overlay, ... }:
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
