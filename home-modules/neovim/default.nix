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
    enableMan = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    # https://nix-community.github.io/nixvim/colorschemes/base16/colorscheme.html?highlight=colorschemes.base16.colo#colorschemesbase16colorscheme
    type = "lua";
    wrapRc = false;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    opts = { };
    match = { };
    files = { };
    globals = { };
    extraFiles = { };
    localOpts = { };
    globalOpts = { };
    extraConfigLua = "";
    extraConfigVim = "";
    extraConfigLuaPre = "";
    extraConfigLuaPost = "";
    extraPackages = with pkgs; [ ];
    extraLuaPackages = with pkgs; [ ];
    extraPython3Packages = p: with p; [ ];
    extraPlugins = with pkgs.vimPlugins; [
      hop-nvim
      nvim-cmp
      vim-rhubarb
      base16-nvim
      null-ls-nvim
      colorbuddy-nvim
      nvim-colorizer-lua
    ];
    plugins = {
      nix.enable = true;
      wtf.enable = true;
      zellij.enable = true;
      luasnip.enable = true;
      trouble.enable = true;
      gitsigns.enable = true;
      cmp-path.enable = true;
      telescope.enable = true;
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
      treesitter-context.enable = true;
      ts-context-commentstring.enable = true;
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
    };
  };
}
