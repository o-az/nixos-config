# https://home-manager-options.extranix.com/?query=programs.bat.
{ pkgs-unstable, ... }: {
  programs.bat = {
    enable = true;
    config = { theme = "1337"; };
    extraPackages = with pkgs-unstable.bat-extras; [ batgrep batman batpipe batwatch batdiff ];
  };
}
