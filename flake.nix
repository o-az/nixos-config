{
  description = "NixOS configuration";

  inputs = {
    # consider switching to github:numtide/nixpkgs-unfree?ref=nixos-unstable
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nix-darwin.url = "github:lnl7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    helix.url = "github:helix-editor/helix";

    nvix.url = "github:niksingh710/nvix";
    nvix.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    ghostty.url = "git+ssh://git@github.com/ghostty-org/ghostty";
    ghostty.inputs.nixpkgs-stable.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      nvix,
      nixpkgs,
      ghostty,
      home-manager,
      ...
    }:
    let
      user = "o";
      system = "aarch64-linux";
      supportedSystems = [ "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      mkNixos = import ./nixos.nix;
      overlays = [ ];
    in
    {
      # Custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs nixpkgs; };

      # Devshell for bootstrapping
      # Accessible through 'nix develop' or 'nix-shell' (legacy)
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        import ./shell.nix { inherit pkgs; }
      );
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations =
        let
          system = "aarch64-linux";
        in
        {

          # orbstack machine
          vm-orb = mkNixos "vm-orb" {
            inherit
              nvix
              user
              inputs
              system
              nixpkgs
              ghostty
              overlays
              home-manager
              ;
          };

          # TODO: add more machines (parallels NixOS, etc.)

          # parallels vm, installed .iso from https://channels.nixos.org/nixos-24.05/latest-nixos-gnome-aarch64-linux.iso
          # vm-aarch64-parallels = mkNixos "vm-aarch64-parallels" {
          #   inherit
          #     nvix
          #     user
          #     inputs
          #     system
          #     nixpkgs
          #     ghostty
          #     overlays
          #     home-manager
          #     ;
          # };
        };
    };
}
