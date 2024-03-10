# https://mipmip.github.io/home-manager-option-search/?query=programs.nvim

{ pkgs, pkgs-unstable, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs-unstable;
      [
        # vimPlugins.vim-airline
        # vimPlugins.vim-airline-themes
        # vimPlugins.vim-commentary
        # vimPlugins.vim-fugitive
        # vimPlugins.vim-gitgutter
        # vimPlugins.vim-surround
        # vimPlugins.vim-unimpaired
        # vimPlugins.vim-repeat
        # vimPlugins.vim-eunuch
        # vimPlugins.vim-sneak
        # vimPlugins.vim-sandwich
        # vimPlugins.vim-easymotion
        # vimPlugins.vim-obsession
        # vimPlugins.vim-startify
      ];
  };
}
