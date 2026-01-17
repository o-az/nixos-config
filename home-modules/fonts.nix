# https://home-manager-options.extranix.com/?query=fonts.&release=master
{ pkgs, config, ... }:
{
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ ];
        monospace = [ "DepartureMono" ];
      };
    };
  };
  home.packages =
    with pkgs;
    [
      ibm-plex
      noto-fonts
      plemoljp-nf
      departure-mono
      jetbrains-mono
      noto-fonts-color-emoji
      # (pkgs.nerdfonts.override {
      #   fonts = [
      #     "IBMPlexMono"
      #     "JetBrainsMono"
      #   ];
      # })
    ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
