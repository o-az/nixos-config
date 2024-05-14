# https://nix-community.github.io/nixvim/NeovimOptions/index.html

{
  pkgs,
  config,
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
    opts = {
      number = true;
      relativenumber = false;
    };
    match = { };
    files = { };
    globals = { };
    extraFiles = { };
    localOpts = { };
    globalOpts = { };
    extraConfigVim = "";
    extraConfigLuaPre = "";
    extraConfigLuaPost = "";
    extraPackages = with pkgs; [ ];
    extraLuaPackages = with pkgs; [ ];
    extraPython3Packages = p: with p; [ ];
    extraConfigLua = builtins.readFile ./extra-config.lua;
    extraPlugins = with pkgs.vimPlugins; [
      # nvim-cmp
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
      cmp.enable = true;
      cmp-rg.enable = true;
      cmp-fish.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-treesitter.enable = true;

      nix.enable = true;
      wtf.enable = true;
      emmet.enable = true;
      direnv.enable = true;
      zellij.enable = true;
      luasnip.enable = true;
      comment.enable = true;
      trouble.enable = true;
      navbuddy.enable = true;
      gitsigns.enable = true;
      diffview.enable = true;
      coq-nvim.enable = true;
      lightline.enable = true;
      which-key.enable = true;
      ts-autotag.enable = true;
      copilot-vim.enable = true;
      vim-matchup.enable = true;
      todo-comments.enable = true;
      vim-css-color.enable = true;
      coq-thirdparty.enable = true;
      nvim-autopairs.enable = true;
      friendly-snippets.enable = true;
      navic = {
        enable = true;
        click = true;
        highlight = true;
      };
      gitgutter = {
        enable = true;
        enableByDefault = true;
        grep = {
          command = "rg";
          package = pkgs.ripgrep;
        };
      };
      ts-context-commentstring = {
        enable = true;
        disableAutoInitialization = false;
      };
      auto-session = {
        enable = true;
        autoSave.enabled = true;
        autoRestore.enabled = true;
      };
      bufferline = {
        enable = true;
        hover = {
          delay = 300;
        };
      };
      wilder = {
        enable = true;
        enableCmdlineEnter = true;
      };
      oil = import ./plugins/oil.nix;
      lsp = import ./plugins/lsp.nix;
      lint = import ./plugins/lint.nix;
      noice = import ./plugins/noice.nix;
      # coq-nvim = import ./plugins/coq.nix;
      barbar = import ./plugins/barbar.nix;
      fidget = import ./plugins/fidget.nix;
      notify = import ./plugins/notify.nix;
      lspsaga = import ./plugins/lspsaga.nix;
      fzf-lua = import ./plugins/fzf-lua.nix;
      lualine = import ./plugins/lualine.nix;
      none-ls = import ./plugins/none-ls.nix;
      neo-tree = import ./plugins/neo-tree.nix;
      neoscroll = import ./plugins/neoscroll.nix;
      telescope = import ./plugins/telescope.nix;
      treesitter = import ./plugins/treesitter.nix;
      typescript-tools = import ./plugins/typescript-tools.nix;
      treesitter-context = import ./plugins/treesitter-context.nix;
      treesitter-textobjects = import ./plugins/treesitter-textobjects.nix;
    };
    keymaps = import ./keymaps.nix;
  };
}
