# https://nix-community.github.io/nixvim/plugins/none-ls/index.html
# https://github.com/nvimtools/none-ls.nvim
{
  enable = true;
  sources = {
    code_actions = {
      statix.enable = true;
      gitsigns.enable = true;
      gitrebase.enable = true;
      ts_node_action.enable = true;
    };
    diagnostics = {
      statix.enable = true;
      deadnix.enable = true;
      markdownlint.enable = true;
    };
  };
}
