# https://mipmip.github.io/home-manager-option-search/?query=programs.helix

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "dracula_at_night";
      editor = {
        auto-format = true;
        auto-save = true;
        completion-trigger-len = 0;
        scroll-lines = 1;
        scrolloff = 5;
        cursorline = true;
        color-modes = true;
        indent-guides.render = false;
        file-picker.hidden = false;
        auto-pairs = true;
        lsp = {
          enable = true;
          display-messages = true;
          display-inlay-hints = true;
        };
        bufferline = "always";
        statusline = {
          left = [ "mode" "spinner" "file-name" ];
          right = [ "diagnostics" "position" "total-line-numbers" "file-encoding" ];
          center = [ "version-control" ];
        };
        soft-wrap = { enable = true; };
      };
      keys.normal.space = {
        "q" = ":q";
        "w" = ":w";
        "h" = ":toggle-option lsp.display-inlay-hints";
        "c" = [ ":write-all" ];
        # f and F are swapped, as picking in cwd is much more common for me.
        "f" = "file_picker_in_current_directory";
        "F" = "file_picker";
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = { command = "nixfmt"; };
        }
        {
          name = "astro";
          auto-format = true;
          formatter = { command = "prettier"; };
        }
        {
          name = "javascript";
          auto-format = true;
          formatter = {
            command = "biome";
            args = [ "format" "--write" ];
          };
        }
        {
          name = "typescript";
          auto-format = true;
          formatter = {
            command = "biome";
            args = [ "format" "--write" ];
          };
        }
        {
          name = "svelte";
          formatter = {
            command = "prettier";
            args = [ "--parser" "svelte" ];
          };
          auto-format = true;
        }
      ];

      language-server = {
        rust-analyzer = {
          config = {
            checkOnSave.command = "clippy";
            # Careful! If you enable this, then a lot of errors
            # will no longer show up in Helix. Do not enable it.
            # cargo.allFeatures = true; <- do NOT enable me
          };
        };
        typescript-language-server = { config = { format = { "semicolons" = "ignore"; }; }; };
      };
    };
  };
}
