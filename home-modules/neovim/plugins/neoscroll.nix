# https://nix-community.github.io/nixvim/plugins/neoscroll/index.html
# https://github.com/karb94/neoscroll.nvim
{
  enable = true;
  settings = {
    stop_eof = true;
    mappings = [
      "<C-u>"
      "<C-d>"
      "<C-b>"
    ];
  };
}
