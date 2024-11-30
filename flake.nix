{
  description = "NixOS systems & configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # consider switching to github:numtide/nixpkgs-unfree?ref=nixos-unstable
    nix-darwin.url = "github:lnl7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    ghostty.url = "git+ssh://git@github.com/ghostty-org/ghostty";
    ghostty.inputs.nixpkgs-stable.follows = "nixpkgs";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    zjstatus.url = "github:dj95/zjstatus";

    helix.url = "github:helix-editor/helix";

    catppuccin.url = "github:catppuccin/nix";

    _1password-shell-plugins.url = "github:1Password/shell-plugins";
  };

  outputs =
    inputs@{
      stylix,
      chaotic,
      nixpkgs,
      ghostty,
      zjstatus,
      nix-darwin,
      catppuccin,
      flake-utils,
      home-manager,
      ...
    }:
    let
      user = "o";
      overlays = [ ];
      mkNixos = import ./nixos.nix;
      mkDarwin = import ./darwin.nix;
    in
    # Custom packages and modifications, exported as overlays
    {
      overlays = import ./overlays { inherit inputs nixpkgs; };
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#vm-orb'
      nixosConfigurations =
        let
          system = "aarch64-linux";
        in
        {
          # orbstack machine
          vm-orb = mkNixos "vm-orb" {
            inherit
              user
              stylix
              inputs
              system
              nixpkgs
              ghostty
              zjstatus
              overlays
              catppuccin
              home-manager
              ;
          };

          # parallels vm, installed .iso from https://channels.nixos.org/nixos-24.05/latest-nixos-gnome-aarch64-linux.iso
          # available through 'nixos-rebuild --flake .#vm-aarch64-parallels'
          vm-aarch64-parallels = mkNixos "vm-aarch64-parallels" {
            inherit
              user
              stylix
              inputs
              system
              nixpkgs
              ghostty
              zjstatus
              overlays
              catppuccin
              home-manager
              ;
          };
        };

      # Darwin configuration entrypoint
      # Available through 'nixos-rebuild --flake .#o'
      darwinConfigurations =
        let
          system = "aarch64-darwin";
        in
        {
          vm-osx = mkDarwin "vm-osx" {
            inherit
              user
              inputs
              system
              nixpkgs
              ghostty
              zjstatus
              overlays
              catppuccin
              nix-darwin
              home-manager
              ;
          };
        };
    }
    // (flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells = import ./shell.nix { inherit pkgs; };
      }
    ));

}
