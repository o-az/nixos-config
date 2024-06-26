# https://nix-community.github.io/nixvim/plugins/lualine/index.html
# https://github.com/nvim-lualine/lualine.nvim
{
  enable = true;
  alwaysDivideMiddle = true;
  globalstatus = true;
  ignoreFocus = [ "neo-tree" ];
  extensions = [ "fzf" ];
  theme = "base16";
  componentSeparators = {
    left = "|";
    right = "|";
  };
  sectionSeparators = {
    left = "█"; # 
    right = "█"; # 
  };
  sections = {
    lualine_a = [ "mode" ];
    lualine_b = [
      {
        name = "branch";
        icon = "";
      }
      "diff"
      "diagnostics"
    ];
    lualine_c = [ "filename" ];
    lualine_x = [ "filetype" ];
    lualine_y = [ "progress" ];
    lualine_z = [ "" ];
  };
}
