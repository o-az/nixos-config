# https://www.nushell.sh/
# https://home-manager-options.extranix.com/?query=programs.nushell.
{ pkgs, ... }:
let
  rawAliases = import ../aliases.nix;
  processedAliases = value: builtins.replaceStrings [ "$SHELL" ] [ "$env.SHELL" ] value;
  shellAliases = builtins.removeAttrs (builtins.mapAttrs (_: processedAliases) rawAliases) [ "ls" ];
in
{
  programs.nushell = {
    enable = true;
    package = pkgs.nushell;
    extraConfig = "";
    inherit shellAliases;
    configFile.source = ./config.nu;
  };
  programs.carapace = {
    enable = true;
    package = pkgs.carapace;
    enableNushellIntegration = true;
  };
}
