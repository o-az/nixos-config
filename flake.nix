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
      home-manager,
      ...
    }:
    let
      user = "o";
      supportedSystems = [
        "aarch64-linux"
        "aarch64-darwin"
      ];
      overlays = [ ];
      mkNixos = import ./nixos.nix;
      mkDarwin = import ./darwin.nix;
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
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
      # Available through 'nixos-rebuild --flake .#hostname'
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

          # TODO: add more machines (parallels NixOS, etc.)

          # parallels vm, installed .iso from https://channels.nixos.org/nixos-24.05/latest-nixos-gnome-aarch64-linux.iso
          # vm-aarch64-parallels = mkNixos "vm-aarch64-parallels" {
          #   inherit
          #     user
          #     inputs
          #     system
          #     nixpkgs
          #     ghostty
          #     overlays
          #     zjstatus
          #     catppuccin
          #     home-manager
          #     ;
          # };
        };
      # Darwin configuration entrypoint
      # Available through 'nixos-rebuild --flake .#hostname'
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
              overlays
              zjstatus
              catppuccin
              nix-darwin
              home-manager
              ;
          };
        };
    };

}
