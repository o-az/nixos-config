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
        monospace = [ "BlexMonoNerdFontMono" ];
      };
    };
    packages = with pkgs; [
      ibm-plex
      nerdfonts
      noto-fonts
      jetbrains-mono
      noto-fonts-emoji
      (pkgs.nerdfonts.override {
        fonts = [
          "IBMPlexMono"
          "JetBrainsMono"
        ];
      })
    ];
  };
}
