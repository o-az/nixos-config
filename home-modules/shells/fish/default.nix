#
# available home-manager options:
# https://home-manager-options.extranix.com/?query=programs.fish&release=master
#
# fish plugins available in nixpkgs:
# https://search.nixos.org/packages?channel=unstable&from=0&size=500&sort=relevance&type=packages&query=fishPlugins.
#
{ pkgs, ... }:

let
  fishFunctionsSource = builtins.filterSource (
    path: type:
    let
      base = builtins.baseNameOf path;
    in
    !(base == "br.fish" && type == "symlink")
  ) ./functions;
in
{
  programs = {
    fish = {
      enable = true;
      package = pkgs.fish;
      plugins = with pkgs.fishPlugins; [
        {
          name = "fzf";
          inherit (fzf-fish) src;
        }
        {
          name = "autopair";
          inherit (autopair) src;
        }
        {
          name = "spark";
          src = pkgs.fetchFromGitHub {
            owner = "jorgebucaran";
            repo = "spark.fish";
            rev = "90a60573ec8a8ecb741a861e0bfca2362f297e5f";
            hash = "sha256-cRSZeqtXSaEKuHeTSk3Kpmwf98mKJ986x1KSxa/HggU=";
          };
        }
      ];
      shellAliases = import ../aliases.nix;
      shellInit = ''
        touch $XDG_CONFIG_HOME/.curlrc
        echo > $XDG_CONFIG_HOME/.curlrc "\
        --silent
        --location
        --show-error
        --trace-time"
      '';
    };
  };

  xdg = {
    configFile = {
      "fish/config.fish".source = ./config.fish;
      "fish/fish_variables".source = ./fish_variables;
      "fish/themes".source = ./themes;
      "fish/completions".source = ./completions;
      "fish/functions".source = fishFunctionsSource;
      "fish/conf.d".source = ./conf.d;
    };
  };
}
