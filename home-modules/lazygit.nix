# https://home-manager-options.extranix.com/?query=programs.lazygit.
{ pkgs, ... }:
{
  programs.lazygit = {
    enable = true;
    package = pkgs.lazygit;
    settings = {
      gui.showBottomLine = false;
      git.paging = {
        colorArg = "always";
        pager = "delta --dark --paging=never";
      };
      os.copyToClipboardCmd = "printf {{text}} | pbcopy";
    };
  };
}
