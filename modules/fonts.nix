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
      noto-fonts
      noto-fonts-emoji
      ibm-plex
      fira-code
      fira-code-symbols
      jetbrains-mono
      iosevka
      (pkgs.nerdfonts.override {
        fonts = [
          "Iosevka"
          "IBMPlexMono"
          "JetBrainsMono"
        ];
      })
    ];
  };
}
