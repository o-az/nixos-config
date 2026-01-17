# https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=fonts.
{ pkgs, ... }:

{
  environment.sessionVariables = {
    FONTCONFIG_PATH = "${pkgs.fontconfig}/etc/fonts";
    FONTCONFIG_FILE = "${pkgs.fontconfig}/etc/fonts/fonts.conf";
  };
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    fontconfig = {
      enable = true;
      cache32Bit = true;
      allowBitmaps = true;
      useEmbeddedBitmaps = true;
      defaultFonts = {
        monospace = [ "DepartureMono" ];
      };
    };
    packages =
      with pkgs;
      [
        ibm-plex
        noto-fonts
        departure-mono
        jetbrains-mono
        noto-fonts-color-emoji
      ]
      ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  };
}
