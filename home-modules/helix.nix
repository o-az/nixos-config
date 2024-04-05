# https://home-manager-options.extranix.com/?query=helix.

{ inputs, pkgs, ... }:
{
  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;
    # extraPackages = [ pkgs.helix ];
    settings = {
      theme = "amberwood";
      editor = {
        scrolloff = 0;
        auto-save = true;
        scroll-lines = 1;
        auto-pairs = true;
        cursorline = true;
        auto-format = true;
        color-modes = true;
        bufferline = "always";
        file-picker.hidden = false;
        indent-guides.render = false;
        lsp = {
          enable = true;
          display-messages = true;
          display-inlay-hints = true;
        };
        soft-wrap = {
          enable = true;
        };
        statusline = {
          center = [ "version-control" ];
          left = [
            "mode"
            "spinner"
            "file-name"
          ];
          right = [
            "diagnostics"
            "position"
            "total-line-numbers"
            "file-encoding"
          ];
        };
      };
      keys.normal.space = {
        w.w = ":w";
        w.q = ":wq";
        q.q = ":q";
        c = [ ":write-all" ];
        space.space = "file_picker";
        f = "file_picker_in_current_directory";
        h = ":toggle-option lsp.display-inlay-hints";
        esc = [
          "collapse_selection"
          "keep_primary_selection"
        ];
      };
    };
    languages = with pkgs; {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
          };
        }
      ];
      language-server = {
        rust-analyzer = {
          config = {
            checkOnSave.command = "clippy";
          };
        };
        typescript-language-server = with nodePackages; {
          config = {
            documentFormatting = false;
          };
          command = "''${typescript-language-server}/bin/typescript-language-server";
          args = [
            "--stdio"
            "--tsserver-path=''${typescript}/lib/node_modules/typescript/lib"
          ];
        };
      };
    };
  };
}
