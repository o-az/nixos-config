# Shell for bootstrapping flake-enabled nix and home-manager
# You can enter it through 'nix develop' or (legacy) 'nix-shell'

{ pkgs }:
{
  default = pkgs.mkShell {
    # Enable experimental features without having to specify the argument
    NIX_CONFIG = "experimental-features = nix-command flakes recursive-nix";

    buildInputs = with pkgs; [
      gh
      nix
      git
      nixd
      fish
      helix
      yamlfmt
      yamllint
      shellcheck
    ];
  };
}
