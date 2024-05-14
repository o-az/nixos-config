# https://nix-community.github.io/nixvim/plugins/neo-tree/index.html
# https://github.com/nvim-neo-tree/neo-tree.nvim
{
  enable = true;
  extraOptions = { };
  window = {
    width = 25;
    position = "right";
    autoExpandWidth = true;
  };
  defaultComponentConfigs = {
    container = {
      width = "100%";
      rightPadding = 0;
    };
    name = {
      trailingSlash = false;
      useGitStatusColors = true;
    };
  };
  autoCleanAfterSessionRestore = true;
}
