# https://nix-community.github.io/nixvim/plugins/typescript-tools/index.html
{
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
}
