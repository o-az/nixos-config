# https://home-manager-options.extranix.com/?query=programs.kitty&release=master
{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    font = {
      size = 16.0;
      name = "BlexMono Nerd Font Mono";
    };
    keybindings = {
      "ctrl+shift+s" =
        "launch --type=background ~/.config/kitty/kitty-save-session/kitty-save-session-all.sh";
    };
    settings = {
      scrollback_lines = 10000;
      tab_bar_style = "custom";
      tab_bar_align = "left";
      tab_bar_edge = "bottom";
      tab_bar_min_tabs = 2;
      tab_activity_symbol = "none";
      bell_on_tab = "no";
      tab_separator = "";
      tab_bar_margin_width = "0.0";
      tab_bar_margin_height = "0.0";
      active_tab_font_style = "bold";
      url_color = "#0087bd";
      url_style = "curly";
      detect_urls = "yes";
      window_border_width = "0.5pt";
      draw_minimal_borders = "yes";
      hide_window_decorations = "titlebar-only";
      enabled_layouts = "tall:bias=50,fat:bias=50,grid,splits";
      enable_layouts = "horizontal";
      window_margin_width = "4";
      placement_strategy = "center";
    };
    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    extraConfig = ''
      # ==============================================================================
      # Active Configuration
      # ==============================================================================

      # kitty.conf
      allow_remote_control yes
      listen_on unix:@kitty-{kitty_pid}

      # Session restoration - restore last session on startup
      startup_session last

      symbol_map U+2665,U+26A1,U+2B58,U+E000-U+F8FF,U+F0000-U+FFFFD Symbols Nerd Font Mono

      # Remote control
      allow_remote_control yes
      listen_on unix:/tmp/kitty

      # Key mappings
      map cmd+shift+d launch --location=vsplit --cwd=current
      map cmd+shift+shift+d launch --location=hsplit --cwd=current
    '';
  };

  xdg = {
    configFile = {
      "kitty/tab_bar.py".source = ./config/tab_bar.py;
      "kitty/kitty-save-session/kitty-convert-dump.py".source =
        ./config/kitty-save-session/kitty-convert-dump.py;
      "kitty/kitty-save-session/kitty-save-session-common.incl".source =
        ./config/kitty-save-session/kitty-save-session-common.incl;
      "kitty/kitty-save-session/kitty-save-session-all.sh".source =
        ./config/kitty-save-session/kitty-save-session-all.sh;
      "kitty/kitty-save-session/kitty-save-session-remove-inactive.sh".source =
        ./config/kitty-save-session/kitty-save-session-remove-inactive.sh;
      "kitty/kitty-save-session/kitty-save-session-restore-all.sh".source =
        ./config/kitty-save-session/kitty-save-session-restore-all.sh;
    };
  };
}
