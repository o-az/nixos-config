# https://home-manager-options.extranix.com/?query=programs.nvim.&release=master

{ inputs, home-manager, pkgs-unstable, system, ... }: {
  programs.nixvim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs-unstable.system}.default;
    extraPlugins = with pkgs-unstable.vimPlugins; [ base16-nvim plenary-nvim ];
    plugins = {
      treesitter = {
        enable = true;
        nixGrammars = true;
        ensureInstalled = "all";
        moduleConfig.autotag = {
          enable = true;
          filetypes = [ "html" "xml" "astro" "javascriptreact" "typescriptreact" "svelte" "vue" ];
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
