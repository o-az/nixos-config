# https://nix-community.github.io/nixvim/plugins/telescope/index.html
# https://github.com/nvim-telescope/telescope.nvim
{
  enable = true;
  extensions = {
    fzf-native = {
      enable = true;
    };
    ui-select = {
      settings = {
        specific_opts = {
          codeactions = true;
        };
      };
    };
    undo.enable = true;
    file-browser.enable = true;
  };
  # If you'd prefer Telescope not to enter a normal-like mode when hitting escape (and instead exiting), you can map <Esc> to do so via:
  settings = {
    defaults = {
      initial_mode = "normal";
      sorting_strategy = "ascending";
      layout_strategy = "horizontal";
      layout_config = {
        prompt_position = "top";
        width = 150;
      };
      preview = {
        ls_short = true;
      };
      mappings = {
        i = {
          "<esc>" = {
            __raw = ''
              function(...)
                return require("telescope.actions").close(...)
              end'';
          };
        };
      };
    };
  };
  keymaps = {
    "<leader><space>" = {
      action = "find_files, {}";
      options.desc = "Find project files";
    };
    "<leader>/" = {
      action = "live_grep";
      options.desc = "Grep (root dir)";
    };
    "<leader>:" = {
      action = "command_history, {}";
      options.desc = "Command History";
    };
    "<leader>b" = {
      action = "buffers, {}";
      options.desc = "+buffer";
    };
    "<leader>ff" = {
      action = "find_files, {}";
      options.desc = "Find project files";
    };
    "<leader>fr" = {
      action = "oldfiles, {}";
      options.desc = "Recent";
    };
    "<leader>fb" = {
      action = "buffers, {}";
      options.desc = "Buffers";
    };
    "<C-p>" = {
      action = "git_files, {}";
      options.desc = "Search git files";
    };
    "<leader>gc" = {
      action = "git_commits, {}";
      options.desc = "Commits";
    };
    "<leader>gs" = {
      action = "git_status, {}";
      options.desc = "Status";
    };
    "<leader>sa" = {
      action = "autocommands, {}";
      options.desc = "Auto Commands";
    };
    "<leader>sb" = {
      action = "current_buffer_fuzzy_find, {}";
      options.desc = "Buffer";
    };
    "<leader>sc" = {
      action = "command_history, {}";
      options.desc = "Command History";
    };
    "<leader>sC" = {
      action = "commands, {}";
      options.desc = "Commands";
    };
    "<leader>sD" = {
      action = "diagnostics, {}";
      options.desc = "Workspace diagnostics";
    };
    "<leader>sh" = {
      action = "help_tags, {}";
      options.desc = "Help pages";
    };
    "<leader>sH" = {
      action = "highlights, {}";
      options.desc = "Search Highlight Groups";
    };
    "<leader>sk" = {
      action = "keymaps, {}";
      options.desc = "Keymaps";
    };
    "<leader>sM" = {
      action = "man_pages, {}";
      options.desc = "Man pages";
    };
    "<leader>sm" = {
      action = "marks, {}";
      options.desc = "Jump to Mark";
    };
    "<leader>so" = {
      action = "vim_options, {}";
      options.desc = "Options";
    };
    "<leader>sR" = {
      action = "resume, {}";
      options.desc = "Resume";
    };
    "<leader>uC" = {
      action = "colorscheme, {}";
      options.desc = "Colorscheme preview";
    };
  };
}
