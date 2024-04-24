# https://home-manager-options.extranix.com/?query=programs.yazi.
{ inputs, pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.default;
    enableFishIntegration = true;
    settings = {
      log = {
        enabled = false;
      };
      manager = {
        ratio = [
          2
          8
          0
        ];
        show_hidden = true;
        sort_dir_first = true;
      };
    };
    keymap = {
      manager.prepend_keymap = [
        {
          on = [ "l" ];
          run = "plugin --sync smart-enter";
          desc = "Enter the child directory, or open the file";
        }
      ];
    };
  };

  xdg.configFile."plugins".source = ./plugins;
}
