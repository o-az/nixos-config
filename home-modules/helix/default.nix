# https://home-manager-options.extranix.com/?query=helix.

{
  pkgs,
  inputs,
  config,
  ...
}:

{
  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;

    settings = {
      theme = "amberwood";
      editor = {
        scrolloff = 0;
        auto-save = true;
        scroll-lines = 1;
        auto-pairs = true;
        cursorline = true;
        auto-format = true;
        completion-trigger-len = 0;
        color-modes = true;
        true-color = true;
        bufferline = "always";
        file-picker.hidden = false;
        indent-guides.render = false;
        file-picker.max-depth = 4;
        gutters = [
          "diff"
          "line-numbers"
          "spacer"
          "diagnostics"
        ];
        lsp = {
          enable = true;
          display-messages = true;
          display-inlay-hints = true;
        };
        soft-wrap = {
          enable = true;
        };
        statusline = {

          mode = {
            normal = "NORMAL";
            select = "SELECT";
            insert = "INSERT";
          };
          left = [
            "mode"
            "file-name"
          ];
          center = [ "version-control" ];
          right = [
            "diagnostics"
            "selections"
            "position"
            "file-encoding"
            "file-line-ending"
            "file-type"
            "version-control"
            "spacer"
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
        {
          name = "bash";
          language-servers = [
            "bash-language-server"
            "copilot"
          ];
        }
        {
          name = "markdown";
          language-servers = [
            "marksman"
            "ltex-ls"
          ];
        }
        {
          name = "go";
          formatter = {
            command = "goimports";
          };
          language-servers = [
            "gopls"
            "copilot"
          ];
          auto-format = true;
        }
        {
          name = "rust";
          language-servers = [
            "rust-analyzer"
            "copilot"
          ];
        }
        {
          name = "html";
          indent.tab-width = 2;
          indent.unit = " ";
          auto-format = false;
        }
        {
          name = "css";
          indent.tab-width = 4;
          indent.unit = " ";
          language-servers = [
            "css-languageserver"
            "copilot"
          ];
        }
        {
          name = "typescript";
          indent.tab-width = 4;
          indent.unit = " ";
          auto-format = true;
          language-servers = [
            "typescript-language-server"
            "copilot"
          ];
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
