# https://nix-community.github.io/nixvim/plugins/gitgutter/index.html
# https://github.com/airblade/vim-gitgutter
{ pkgs }:
{
  enable = true;
  enableByDefault = true;
  grep = {
    command = "rg";
    package = pkgs.ripgrep;
  };
}
