{ pkgs, ... }:

{
  fonts = { fontconfig = { enable = true; }; };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    ibm-plex
    fira-code
    fira-code-symbols
    (pkgs.nerdfonts.override { fonts = [ "IBMPlexMono" ]; })
  ];
}
