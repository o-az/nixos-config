# https://nix-community.github.io/nixvim/NeovimOptions/index.html

{
  inputs,
  home-manager,
  pkgs,
  system,
  ...
}:
{
  programs.nixvim = {
    enable = true;
    enableMan = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    # https://nix-community.github.io/nixvim/colorschemes/base16/colorscheme.html?highlight=colorschemes.base16.colo#colorschemesbase16colorscheme
    # colorschemes = {
    #   base16 = {
    #     enable = true;
    #     colorscheme = "kanagawa";
    #   };
    # };
    extraConfigLua = "";
    extraConfigLuaPost = "";
    extraConfigLuaPre = "";
    extraConfigVim = "";
    extraFiles = { };
    extraPackages = with pkgs; [ ];
    # extraPython3Packages = with pkgs; [ ];
    files = { };
    globalOpts = { };
    globals = { };
    localOpts = { };
    match = { };
    opts = { };
    type = "lua";
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    wrapRc = false;
    extraPlugins = with pkgs.vimPlugins; [
      base16-nvim
      plenary-nvim
    ];
    plugins = {
      treesitter = {
        enable = true;
        nixGrammars = true;
        ensureInstalled = "all";
        moduleConfig.autotag = {
          enable = true;
          filetypes = [
            "html"
            "xml"
            "astro"
            "javascriptreact"
            "typescriptreact"
            "svelte"
            "vue"
          ];
        };
        nixvimInjections = true;
      };
      lsp = {
        enable = true;
        servers = {
          # rnix-lsp.enable = true;
          # rust-analyzer.enable = true;
          # rust-analyzer.installRustc = true;
          # rust-analyzer.installCargo = true;
          # clangd.enable = true;
          # zls.enable = true;
          # pyright.enable = true;
          # gopls.enable = true;
          # elixirls.enable = true;
          # hls.enable = true;
          astro.enable = true;
          tsserver.enable = true;
          svelte.enable = true;
        };
      };
    };
  };
}
