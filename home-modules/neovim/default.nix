# https://mipmip.github.io/home-manager-option-search/?query=programs.nvim

{ ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    # extraPackages = { };
  };
}
