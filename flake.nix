{
  description = "NixOS systems & configuration";

  inputs = {
    # consider switching to github:numtide/nixpkgs-unfree?ref=nixos-unstable
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/0.1";

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
  };

  outputs =
    inputs@{
      stylix,
      chaotic,
      nixpkgs,
      ghostty,
      zjstatus,
      nix-darwin,
      flake-utils,
      determinate,
      flake-parts,
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
              determinate
              home-manager
              ;
          };
        };

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
              nix-darwin
              determinate
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
