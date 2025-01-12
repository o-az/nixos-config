# https://home-manager-options.extranix.com/?query=programs.zellij.
# https://zellij.dev/documentation/
{
  lib,
  pkgs,
  config,
  ...
}:

with lib;
{
  programs.zellij = {
    enable = true;
    package = pkgs.zellij;
    # enabling this will enter zellij when starting fish
    enableFishIntegration = false;
  };

  # Nix does not translate nicely to KDL so we use a KDL file instead.
  xdg.configFile."zellij/config.kdl".source = ./config.kdl;
}
