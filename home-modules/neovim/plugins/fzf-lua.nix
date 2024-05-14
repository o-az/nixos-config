# https://nix-community.github.io/nixvim/plugins/fzf-lua/index.html
# https://github.com/ibhagwan/fzf-lua
{
  enable = true;
  iconsEnabled = true;
  profile = "telescope";
  settings = {
    files = {
      color_icons = true;
      file_icons = true;
      find_opts = {
        __raw = "[[-type f -not -path '*.git/objects*' -not -path '*.env*']]";
      };
      multiprocess = true;
      prompt = "Files❯ ";
    };
    winopts = {
      col = 0.3;
      height = 0.4;
      row = 0.99;
      width = 0.93;
    };
  };
  keymaps = {
    "<C-f>" = {
      action = "git_files";
      options = {
        desc = "Fzf-Lua Git Files";
        silent = true;
      };
      settings = {
        previewers = {
          cat = {
            cmd = "/nix/store/hq8765g3p1i7qbargnqli5mn0jpsdbfl-coreutils-9.5/bin/cat";
          };
        };
        winopts = {
          height = 0.5;
        };
      };
    };
    "<leader>fg" = "live_grep";
  };
}
