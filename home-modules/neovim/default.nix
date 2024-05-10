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
      base16 = {
        enable = true;
        colorscheme = "catppuccin-mocha";
      };
    };
    opts = { };
    match = { };
    files = { };
    globals = { };
    extraFiles = { };
    localOpts = { };
    globalOpts = { };
    extraConfigLua = builtins.readFile ./extra-config.lua;
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
      oil.enable = true;
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
      neo-tree = import ./plugins/neo-tree.nix;
      gitgutter = {
        enable = true;
        enableByDefault = true;
        grep = {
          command = "rg";
          package = pkgs.ripgrep;
        };
      };
      coq-thirdparty = {
        enable = true;
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
      lsp = import ./plugins/lsp.nix;
      noice = import ./plugins/noice.nix;
      coq-nvim = import ./plugins/coq.nix;
      fidget = import ./plugins/fidget.nix;
      lualine = import ./plugins/lualine.nix;
      telescope = import ./plugins/telescope.nix;
      treesitter = import ./plugins/treesitter.nix;
      treesitter-textobjects = import ./plugins/treesitter-textobjects.nix;
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
    };
    keymaps = import ./keymaps.nix;
  };
}
