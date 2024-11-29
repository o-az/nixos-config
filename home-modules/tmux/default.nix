# https://home-manager-options.extranix.com/?query=programs.tmux.
# https://search.nixos.org/packages?sort=relevance&type=packages&query=tmuxplugins
{ pkgs, ... }:
let
  tmux-super-fingers = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-super-fingers";
    version = "latest";
    src = pkgs.fetchFromGitHub {
      owner = "artemave";
      repo = "tmux_super_fingers";
      rev = "2771f791a03880b3653c043cff48ee81db66212b";
      sha256 = "sha256-GnVlV8JRKVx6muVKYvqkCSMds7IBTYp1NFEgQnnuYEc=";
    };
  };
  tmux-browser = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-browser";
    version = "latest";
    src = pkgs.fetchFromGitHub {
      owner = "ofirgall";
      repo = "tmux-browser";
      rev = "243704b048668fa0dcf34ebd4857fe8e9500e88a";
      sha256 = "sha256-yPtNeU7yZGvJ0M9A2+zrpEHe6yPKqVhWyB0NzI1oXRA=";
    };
  };

in
{
  programs.tmux = {
    enable = true;
    package = pkgs.tmux;
    mouse = true;
    clock24 = true;
    tmuxp.enable = true;
    tmuxinator.enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "xterm-ghostty";
    plugins = with pkgs; [
      tmuxPlugins.tmux-thumbs
      tmuxPlugins.better-mouse-mode
      {
        plugin = tmux-super-fingers;
        extraConfig = "set -g @super-fingers-key f";
      }
      {
        plugin = tmuxPlugins.cpu;
        extraConfig = ''
          set -g @plugin "tmux-plugins/tmux-cpu"
        '';
      }
      {
        plugin = tmuxPlugins.yank;
        extraConfig = ''
          set -g @plugin "tmux-plugins/tmux-yank"
        '';
      }
      {
        plugin = tmuxPlugins.sidebar;
        extraConfig = ''
          set -g @plugin 'tmux-plugins/tmux-sidebar'
          set -g @sidebar-tree-position 'right'
          set -g @sidebar-tree-command 'tree -C'
        '';
      }
      tmuxPlugins.copycat
      tmuxPlugins.tmux-fzf
      tmuxPlugins.fzf-tmux-url

      {
        plugin = tmux-super-fingers;
        extraConfig = "set -g @super-fingers-key f";
      }
      {
        plugin = tmux-browser;
        extraConfig = ''
          set -g @browser_close_on_deattach '1'
        '';
      }

      tmuxPlugins.sensible
      # must be before continuum edits right status bar
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'frappe'
          set -g @catppuccin_window_tabs_enabled on
          set -g @catppuccin_date_time "%H:%M"
        '';
      }
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '10'
        '';
      }
      tmuxPlugins.yank
      tmuxPlugins.better-mouse-mode

    ];
    extraConfig = ''
      set-option -g default-shell $SHELL

      ###############################################################################
      # Behaviour
      ###############################################################################

      # Otherwise nvim colours are messed up
      set -g default-terminal $TERM

      # Enable copying to clipboard with mouse
      set -s set-clipboard off
      set-option -s set-clipboard off
      # bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"

      # Use vim keybindings in copy mode
      set-option -g mouse on

      # Enable mouse controls
      set -g mouse on

      setw -g mode-keys vi

      setw -g xterm-keys on

      # faster command sequences
      set -s escape-time 10

      # increase repeat timeout
      set -sg repeat-time 600
      set -s focus-events on

      setw -q -g utf8 on

      # # Increase default pane buffer size
      set-option -g history-limit 10000

      # start windows numbering at 1
      set -g base-index 1

      # make pane numbering consistent with windows
      setw -g pane-base-index 1

      # rename window to reflect current program
      setw -g automatic-rename on

      # renumber windows when a window is closed
      set -g renumber-windows on

      # set terminal title
      set -g set-titles on

      # slightly longer pane indicators display time
      set -g display-panes-time 800

      # slightly longer status messages display time
      set -g display-time 1000

      # redraw status line every 10 seconds
      set -g status-interval 10

      # activity - set quite mode
      set -g monitor-activity on
      setw -g monitor-activity off
      set -g visual-activity off
      set -g visual-bell off
      set -g visual-silence off
      set -g bell-action none

      set-option -sa terminal-features ',XXX:RGB'

      set -g @catppuccin_flavour 'mocha'
    '';
  };
  programs.fzf.tmux.enableShellIntegration = true;
}
