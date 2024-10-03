# https://home-manager-options.extranix.com/?query=programs.kitty.
{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    settings = {
      font_family = "JetBrainsMono Nerd Font";
      font_size = 15;
      scrollback_lines = 10000;
      cursor_blink_interval = 0;
      tab_bar_margin_width = 0;
      tab_title_template = "{fmt.fg.pink}{title}{fmt.fg.default}";
      window_border_width = 1;
      window_padding_width = 1;
      enable_audio_bell = false;
      hide_window_decorations = "titlebar-only";
    };
  };
}
