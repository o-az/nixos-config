# https://home-manager-options.extranix.com/?query=programs.direnv.
# https://home-manager-options.extranix.com/?query=programs.nix-direnv.
{ pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };
    config.global = {
      # Make direnv messages less verbose
      hide_env_diff = true;
    };
  };
}
