# https://nix-community.github.io/nixvim/plugins/lint/index.html
# https://github.com/mfussenegger/nvim-lint
{
  enable = true;
  lintersByFt = {
    nix = [ "statix" ];
    lua = [ "selene" ];
    javascript = [ "biome" ];
    javascriptreact = [ "biome" ];
    typescript = [ "biome" ];
    typescriptreact = [ "biome" ];
    json = [ "biome" ];
  };
}
