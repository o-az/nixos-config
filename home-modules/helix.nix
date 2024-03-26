# https://home-manager-options.extranix.com/?query=helix.

{ inputs, pkgs-unstable, ... }: {
  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs-unstable.system}.default;
    settings = {
      theme = "amberwood";
      editor = {
        auto-format = true;
        auto-save = true;
        scroll-lines = 1;
        scrolloff = 0;
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

    languages = with pkgs-unstable; {
      language = [{
        name = "nix";
        auto-format = true;
        formatter = { command = "nixfmt"; };
      }];

      language-server = {
        rust-analyzer = { config = { checkOnSave.command = "clippy"; }; };
        typescript-language-server = with nodePackages; {
          config = { documentFormatting = false; };
          command = "''${typescript-language-server}/bin/typescript-language-server";
          args = [ "--stdio" "--tsserver-path=''${typescript}/lib/node_modules/typescript/lib" ];
        };
      };
    };
  };
}
