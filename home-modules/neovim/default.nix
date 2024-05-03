# https://nix-community.github.io/nixvim/NeovimOptions/index.html

{
  pkgs,
  system,
  inputs,
  ...
}:
{
  programs.nixvim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    # https://nix-community.github.io/nixvim/colorschemes/base16/colorscheme.html?highlight=colorschemes.base16.colo#colorschemesbase16colorscheme
    type = "lua";
    wrapRc = false;
    viAlias = true;
    vimAlias = true;
    enableMan = true;
    withNodeJs = true;
    colorschemes = {
      rose-pine = {
        enable = true;
        settings = {
          styles = {
            italic = true;
            bold = true;
            transparency = false;
          };
        };
      };
    };
    opts = { };
    match = { };
    files = { };
    globals = { };
    extraFiles = { };
    localOpts = { };
    globalOpts = { };
    extraConfigLua = ''
      local telescope = require('telescope')
      telescope.setup{
          pickers = {
            colorscheme = {
              enable_preview = true
            }
          }
      }

      require("telescope").load_extension("lazygit")

    '';
    extraConfigVim = "";
    extraConfigLuaPre = "";
    extraConfigLuaPost = "";
    extraPackages = with pkgs; [ ];
    extraLuaPackages = with pkgs; [ ];
    extraPython3Packages = p: with p; [ ];
    extraPlugins = with pkgs.vimPlugins; [
      nvim-cmp
      nui-nvim
      vim-rhubarb
      base16-nvim
      plenary-nvim
      null-ls-nvim
      lazygit-nvim
      colorbuddy-nvim
      nvim-web-devicons
      nvim-colorizer-lua
    ];
    plugins = {
      nix.enable = true;
      wtf.enable = true;
      emmet.enable = true;
      navic.enable = true;
      direnv.enable = true;
      zellij.enable = true;
      luasnip.enable = true;
      comment.enable = true;
      trouble.enable = true;
      navbuddy.enable = true;
      gitsigns.enable = true;
      diffview.enable = true;
      cmp-path.enable = true;
      which-key.enable = true;
      neoscroll.enable = true;
      cmp-buffer.enable = true;
      ts-autotag.enable = true;
      copilot-vim.enable = true;
      vim-matchup.enable = true;
      cmp-nvim-lsp.enable = true;
      todo-comments.enable = true;
      vim-css-color.enable = true;
      nvim-autopairs.enable = true;
      friendly-snippets.enable = true;
      lint = {
        enable = true;
        lintersByFt = {
          nix = [ "statix" ];
          lua = [ "selene" ];
          javascript = [ "biome" ];
          javascriptreact = [ "biome" ];
          typescript = [ "biome" ];
          typescriptreact = [ "biome" ];
          json = [ "biome" ];
        };
      };
      treesitter-context.enable = true;
      ts-context-commentstring = {
        enable = true;
        disableAutoInitialization = false;
      };
      treesitter-textobjects = {
        enable = false;
        select = {
          enable = true;
          lookahead = true;
          keymaps = {
            "aa" = "@parameter.outer";
            "ia" = "@parameter.inner";
            "af" = "@function.outer";
            "if" = "@function.inner";
            "ac" = "@class.outer";
            "ic" = "@class.inner";
            "ii" = "@conditional.inner";
            "ai" = "@conditional.outer";
            "il" = "@loop.inner";
            "al" = "@loop.outer";
            "at" = "@comment.outer";
          };
        };
        move = {
          enable = true;
          gotoNextStart = {
            "]m" = "@function.outer";
            "]]" = "@class.outer";
          };
          gotoNextEnd = {
            "]M" = "@function.outer";
            "][" = "@class.outer";
          };
          gotoPreviousStart = {
            "[m" = "@function.outer";
            "[[" = "@class.outer";
          };
          gotoPreviousEnd = {
            "[M" = "@function.outer";
            "[]" = "@class.outer";
          };
        };
        swap = {
          enable = true;
          swapNext = {
            "<leader>a" = "@parameters.inner";
          };
          swapPrevious = {
            "<leader>A" = "@parameter.outer";
          };
        };
      };
      noice = {
        enable = true;
        notify = {
          enabled = false;
        };
        messages = {
          enabled = true; # Adds a padding-bottom to neovim statusline when set to false for some reason
        };
        lsp = {
          message = {
            enabled = true;
          };
          progress = {
            enabled = false;
            view = "mini";
          };
        };
        popupmenu = {
          enabled = true;
          backend = "nui";
        };
        format = {
          filter = {
            pattern = [
              ":%s*%%s*s:%s*"
              ":%s*%%s*s!%s*"
              ":%s*%%s*s/%s*"
              "%s*s:%s*"
              ":%s*s!%s*"
              ":%s*s/%s*"
            ];
            icon = "";
            lang = "regex";
          };
          replace = {
            pattern = [
              ":%s*%%s*s:%w*:%s*"
              ":%s*%%s*s!%w*!%s*"
              ":%s*%%s*s/%w*/%s*"
              "%s*s:%w*:%s*"
              ":%s*s!%w*!%s*"
              ":%s*s/%w*/%s*"
            ];
            icon = "󱞪";
            lang = "regex";
          };
        };
      };
      notify = {
        enable = true;
        backgroundColour = "#000000";
        fps = 60;
        render = "default";
        timeout = 500;
        topDown = true;
      };
      auto-session = {
        enable = true;
        autoSave.enabled = true;
        autoRestore.enabled = true;
      };
      neo-tree = {
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
      };
      gitgutter = {
        enable = true;
        enableByDefault = true;
        grep = {
          command = "rg";
          package = pkgs.ripgrep;
        };
      };
      coq-nvim = {
        enable = true;
        installArtifacts = true;
      };
      fzf-lua = {
        enable = true;
        iconsEnabled = true;
        profile = "telescope";
      };
      none-ls = {
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
      };
      bufferline = {
        enable = true;
        hover = {
          delay = 300;
        };
      };
      treesitter = {
        enable = true;
        indent = true;
        # folding = true;
        nixGrammars = true;
        ensureInstalled = "all";
        nixvimInjections = true;
      };
      wilder = {
        enable = true;
        enableCmdlineEnter = true;
      };
      typescript-tools = {
        enable = true;
        settings = {
          jsxCloseTag = {
            enable = true;
            filetypes = [
              "javascriptreact"
              "typescriptreact"
            ];
          };
        };
      };
      lsp = {
        enable = true;
        servers = {
          astro.enable = true;
          svelte.enable = true;
          tsserver.enable = true;
        };
      };
      lualine = {
        enable = true;
        alwaysDivideMiddle = true;
        globalstatus = true;
        ignoreFocus = [ "neo-tree" ];
        extensions = [ "fzf" ];
        theme = "auto";
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
          lualine_z = [ ''" " .. os.date("%R")'' ];
        };
      };
      fidget = {
        enable = true;
        logger = {
          level = "warn"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
          floatPrecision = 1.0e-2; # Limit the number of decimals displayed for floats
        };
        progress = {
          pollRate = 0; # How and when to poll for progress messages
          suppressOnInsert = true; # Suppress new messages while in insert mode
          ignoreDoneAlready = false; # Ignore new tasks that are already complete
          ignoreEmptyMessage = false; # Ignore new tasks that don't contain a message
          clearOnDetach =
            # Clear notification group when LSP server detaches
            ''
              function(client_id)
                local client = vim.lsp.get_client_by_id(client_id)
                return client and client.name or nil
              end
            '';
          notificationGroup =
            # How to get a progress message's notification group key
            ''
              function(msg) return msg.lsp_client.name end
            '';
          ignore = [ ]; # List of LSP servers to ignore
          lsp = {
            progressRingbufSize = 0; # Configure the nvim's LSP progress ring buffer size
          };
          display = {
            renderLimit = 16; # How many LSP messages to show at once
            doneTtl = 3; # How long a message should persist after completion
            doneIcon = "✔"; # Icon shown when all LSP progress tasks are complete
            doneStyle = "Constant"; # Highlight group for completed LSP tasks
            progressTtl = "math.huge"; # How long a message should persist when in progress
            progressIcon = {
              pattern = "dots";
              period = 1;
            }; # Icon shown when LSP progress tasks are in progress
            progressStyle = "WarningMsg"; # Highlight group for in-progress LSP tasks
            groupStyle = "Title"; # Highlight group for group name (LSP server name)
            iconStyle = "Question"; # Highlight group for group icons
            priority = 30; # Ordering priority for LSP notification group
            skipHistory = true; # Whether progress notifications should be omitted from history
            formatMessage = ''
              require ("fidget.progress.display").default_format_message
            ''; # How to format a progress message
            formatAnnote = ''
              function (msg) return msg.title end
            ''; # How to format a progress annotation
            formatGroupName = ''
              function (group) return tostring (group) end
            ''; # How to format a progress notification group's name
            overrides = {
              rust_analyzer = {
                name = "rust-analyzer";
              };
            }; # Override options from the default notification config
          };
        };
        notification = {
          pollRate = 10; # How frequently to update and render notifications
          filter = "info"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
          historySize = 128; # Number of removed messages to retain in history
          overrideVimNotify = true;
          redirect = ''
            function(msg, level, opts)
              if opts and opts.on_open then
                return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
              end
            end
          '';
          configs = {
            default = "require('fidget.notification').default_config";
          };

          window = {
            normalHl = "Comment";
            winblend = 0;
            border = "none"; # none, single, double, rounded, solid, shadow
            zindex = 45;
            maxWidth = 0;
            maxHeight = 0;
            xPadding = 1;
            yPadding = 0;
            align = "bottom";
            relative = "editor";
          };
          view = {
            stackUpwards = true; # Display notification items from bottom to top
            iconSeparator = " "; # Separator between group name and icon
            groupSeparator = "---"; # Separator between notification groups
            groupSeparatorHl =
              # Highlight group used for group separator
              "Comment";
          };
        };
      };
      telescope = {
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
          undo = {
            enable = true;
          };
        };
        # If you'd prefer Telescope not to enter a normal-like mode when hitting escape (and instead exiting), you can map <Esc> to do so via:
        settings = {
          defaults = {
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
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>fp";
        action = "<cmd>Telescope projects<CR>";
        options = {
          desc = "Projects";
        };
      }

      {
        mode = "n";
        key = "<leader>sd";
        action = "<cmd>Telescope diagnostics bufnr=0<cr>";
        options = {
          desc = "Document diagnostics";
        };
      }

      {
        mode = "n";
        key = "<leader>st";
        action = "<cmd>TodoTelescope<cr>";
        options = {
          silent = true;
          desc = "Todo (Telescope)";
        };
      }

      # {
      #   mode = "n";
      #   key = "<leader>,";
      #   action = "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>";
      #   options = {
      #     desc = "Switch Buffer";
      #   };
      # }
      {
        mode = "n";
        key = "<leader>un";
        action = ''
          <cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>
        '';
        options = {
          desc = "Dismiss All Notifications";
        };
      }

      # lazygit
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>LazyGit<CR>";
        options = {
          desc = "LazyGit (root dir)";
        };
      }
    ];
  };
}
