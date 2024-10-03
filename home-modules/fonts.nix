# https://home-manager-options.extranix.com/?query=fonts.&release=master
{ pkgs, config, ... }:
{
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ ];
        monospace = [
          "BlexMonoNerdFontMono"
        ];
      };
    };
  };
  home.packages = with pkgs; [
    plemoljp-nf
    ibm-plex
    nerdfonts
    noto-fonts
    jetbrains-mono
    noto-fonts-emoji
    (pkgs.nerdfonts.override {
      fonts = [
        "Iosevka"
        "IBMPlexMono"
        "JetBrainsMono"
      ];
    })
  ];
}
