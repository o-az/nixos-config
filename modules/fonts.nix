{ pkgs-unstable, ... }:

{
  fonts = { fontconfig = { enable = true; }; };

  fonts.packages = with pkgs-unstable; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    ibm-plex
    fira-code
    fira-code-symbols
    (pkgs-unstable.nerdfonts.override { fonts = [ "IBMPlexMono" ]; })
  ];
}
