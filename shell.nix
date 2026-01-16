# Shell for bootstrapping flake-enabled nix and home-manager
# You can enter it through 'nix develop' or (legacy) 'nix-shell'

{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
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
    biome
  ];
}
