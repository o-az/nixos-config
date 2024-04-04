# https://home-manager-options.extranix.com/?query=programs.bat.
{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    config = { theme = "1337"; };
    extraPackages = with pkgs.bat-extras; [ batgrep batman batpipe batwatch batdiff ];
  };
}
