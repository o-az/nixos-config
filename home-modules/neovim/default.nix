# https://mipmip.github.io/home-manager-option-search/?query=programs.nvim

{ pkgs-unstable, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs-unstable; [ ];
  };
}
