# https://home-manager-options.extranix.com/?query=programs.gh.
# https://home-manager-options.extranix.com/?query=programs.gh-dash.
{ pkgs, ... }:
{
  programs.gh = {
    enable = true;
    package = pkgs.gh;
    settings = {
      prompt = "enabled";
      git_protocol = "ssh";
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
    };
    extensions = with pkgs; [
      gh-f
      gh-poi
      gh-dash
      gh-copilot
    ];
  };
  programs.gh-dash = {
    enable = true;
    package = pkgs.gh-dash;
  };
}
