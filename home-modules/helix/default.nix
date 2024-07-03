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
        rulers = [ 120 ];
        auto-pairs = true;
        cursorline = true;
        true-color = true;
        auto-format = true;
        color-modes = true;
        bufferline = "multiple";
        completion-trigger-len = 0;
        file-picker = {
          max-depth = 4;
          hidden = false;
        };
        indent-guides = {
          render = false;
          character = "╎";
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
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
          separator = "│";
          mode = {
            normal = "NORMAL";
            select = "SELECT";
            insert = "INSERT";
          };
          left = [
            "mode"
            "spinner"
            "file-name"
          ];
          center = [ "version-control" ];
          right = [
            "diagnostics"
            "selections"
            "position"
            "spacer"
          ];
        };
      };
      keys.normal.space = {
        z = "command_palette";
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
          name = "fish";
          scope = "source.fish";
          injection-regex = "fish";
          file-types = [ "fish" ];
          shebangs = [ "fish" ];
          comment-token = "#";
          indent = {
            tab-width = 4;
            unit = "    ";
          };
          auto-format = true;
          formatter = {
            command = "fish_indent";
          };
        }
        {
          name = "nix";
          auto-format = true;
          language-servers = [
            "nixd"
            "copilot"
          ];
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
          name = "javascript";
          indent.tab-width = 2;
          indent.unit = " ";
          auto-format = true;
          language-servers = [
            "biome"
            "copilot"
            "typescript-language-server"
          ];
        }
        {
          name = "typescript";
          indent.tab-width = 2;
          indent.unit = " ";
          auto-format = true;
          language-servers = [
            "biome"
            "copilot"
            "typescript-language-server"
          ];
        }
        {
          name = "jsx";
          indent.tab-width = 2;
          indent.unit = " ";
          auto-format = true;
          language-servers = [
            "biome"
            "copilot"
            "typescript-language-server"
          ];
        }
        {
          name = "tsx";
          indent.tab-width = 2;
          indent.unit = " ";
          auto-format = true;
          language-servers = [
            "biome"
            "copilot"
            "typescript-language-server"
          ];
        }
        {
          name = "json";
          indent.tab-width = 2;
          indent.unit = " ";
          auto-format = true;
          language-servers = [ "biome" ];
        }
      ];
      language-server = {
        biome = {
          command = "biome";
          args = [ "lsp-proxy" ];
        };
        nixd = {
          command = "nixd";
        };
        rust-analyzer = {
          config = {
            checkOnSave.command = "clippy";
          };
        };
        svelteserver = {
          command = "svelteserver";
          args = [ "--stdio" ];
        };
        vscode-css-language-server = {
          command = "vscode-css-language-server";
          args = [ "--stdio" ];
          config = {
            provideFormatter = true;
            css = {
              validate = {
                enable = true;
              };
            };
          };
        };
        vscode-html-language-server = {
          command = "vscode-html-language-server";
          args = [ "--stdio" ];
          config = {
            provideFormatter = true;
          };
        };
        vscode-json-languageserver = {
          command = "vscode-json-language-server";
          args = [ "--stdio" ];
          config = {
            provideFormatter = true;
            json = {
              validate = {
                enable = true;
              };
            };
          };
        };
        tailwind-ls = {
          command = "tailwindcss-language-server";
          args = [ "--stdio" ];
        };
        typescript-language-server = with nodePackages_latest; {
          config = {
            hostInfo = "helix";
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
