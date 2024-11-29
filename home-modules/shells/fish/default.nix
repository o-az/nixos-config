# https://home-manager-options.extranix.com/?query=programs.fish.
# https://search.nixos.org/packages?channel=unstable&from=0&size=500&sort=relevance&type=packages&query=fishPlugins.
{ pkgs, ... }:

let
  fishFunctionsDirectory = ./functions;
  functionFiles = builtins.readDir fishFunctionsDirectory;
  fishFunctions = builtins.listToAttrs (
    builtins.map (
      name:
      let
        functionName = builtins.replaceStrings [ ".fish" ] [ "" ] name;
        functionBody = builtins.readFile "${fishFunctionsDirectory}/${name}";
      in
      {
        name = functionName;
        value.body = functionBody;
      }
    ) (builtins.attrNames functionFiles)
  );
in
{
  programs = {
    fish = {
      enable = true;
      package = pkgs.fish;
      functions = fishFunctions;
      interactiveShellInit = builtins.readFile ./init.fish;
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
}
