{
  description = "NixOS systems & configuration";

  inputs = {
    # consider switching to github:numtide/nixpkgs-unfree?ref=nixos-unstable
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/0.1";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    ghostty.url = "github:ghostty-org/ghostty";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    helix.url = "github:helix-editor/helix";
  };

  outputs =
    inputs@{
      chaotic,
      nixpkgs,
      ghostty,
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
      # mkDarwin = import ./darwin.nix;
    in
    # Custom packages and modifications, exported as overlays
    {
      overlays = import ./overlays {
        inherit inputs nixpkgs;
      };
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#vm-orb'
      nixosConfigurations =
        let
          system = "aarch64-linux";
        in
        {
          nixos = mkNixos "nixos" {
            inherit
              user
              inputs
              system
              nixpkgs
              ghostty
              overlays
              determinate
              home-manager
              ;
          };
        };

      # darwinConfigurations =
      #   let
      #     system = "aarch64-darwin";
      #   in
      #   {
      #     vm-osx = mkDarwin "vm-osx" {
      #       inherit
      #         user
      #         inputs
      #         system
      #         nixpkgs
      #         ghostty
      #         overlays
      #         determinate
      #         home-manager
      #         ;
      #     };
      #   };
    }
    // (flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit
            system
            ;
        };
      in
      {
        devShells = import ./shell.nix { inherit pkgs; };
      }
    ));

}
