# https://home-manager-options.extranix.com/?query=programs.bat.
{ pkgs-unstable, ... }: {
  programs.bat = {
    enable = true;
    extraPackages = with pkgs-unstable.bat-extras; [
      batdiff
      batman
      batgrep
      batwatch
      batpipe
      prettybat
    ];
    config = { theme = "1337"; };
  };
}
