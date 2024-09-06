# https://home-manager-options.extranix.com/?query=programs.yazi.
{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableFishIntegration = true;
    settings = {};
  };
};