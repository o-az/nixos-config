# https://home-manager-options.extranix.com/?query=programs.direnv.
# https://home-manager-options.extranix.com/?query=programs.nix-direnv.
{ pkgs-unstable, ... }:

{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv = {
      enable = true;
      package = pkgs-unstable.nix-direnv;
    };
  };
}
