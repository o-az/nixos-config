# https://home-manager-options.extranix.com/?query=fonts.&release=master
{ pkgs, config, ... }:
{
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ ];
        monospace = [ "BlexMonoNerdFontMono" ];
      };
    };
  };
  home.packages =
    with pkgs;
    [
      ibm-plex
      noto-fonts
      plemoljp-nf
      # ibm-plex-mono
      jetbrains-mono
      noto-fonts-emoji
      # (pkgs.nerdfonts.override {
      #   fonts = [
      #     "IBMPlexMono"
      #     "JetBrainsMono"
      #   ];
      # })
    ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
