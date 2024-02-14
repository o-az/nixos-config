# https://mipmip.github.io/home-manager-option-search/?query=programs.bat

{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch batpipe prettybat ];
    config = { theme = "1337"; };
  };

}
