# https://nix-community.github.io/nixvim/plugins/treesitter-context/index.html
# https://github.com/nvim-treesitter/nvim-treesitter-context/
{
  enable = true;
  settings = {
    enable = true;
    line_numbers = true;
    max_lines = 0;
    min_window_height = 0;
    mode = "topline";
    multiline_threshold = 20;
    separator = "-";
    trim_scope = "inner";
    zindex = 20;
  };
}
