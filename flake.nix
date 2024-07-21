{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";
    flake-parts.url = "github:hercules-ci/flake-parts";

    helix.url = "github:helix-editor/helix";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    # need to fix ssh setup first
    # ghostty.url = "git+ssh://git@github.com/ghostty-org/ghostty.git";
  };

  outputs =
    inputs@{
      nixvim,
      nixpkgs,
      # ghostty,
      home-manager,
      ...
    }:
    let
      user = "omar";
      system = "aarch64-linux";
      supportedSystems = [ "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      mkNixos = import ./nixos.nix;
      overlays = [ inputs.neovim-nightly-overlay.overlays.default ];
    in
    {
      # Custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs nixpkgs; };

      # Devshell for bootstrapping
      # Acessible through 'nix develop' or 'nix-shell' (legacy)
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        import ./shell.nix { inherit pkgs; }
      );

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        vm-orb = mkNixos "vm-orb" {
          inherit
            user
            inputs
            nixvim
            system
            nixpkgs
            # ghostty
            overlays
            home-manager
            ;
        };
      };
    };
}
