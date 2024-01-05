# https://mipmip.github.io/home-manager-option-search/?query=programs.fish

{ pkgs, ... }:

{

  programs.chromium = {
    enable = true;
  };

  programs.zellij = {
    enableFishIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      #format = "$character";
    };

  };

  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];

  };

  programs = {
    eza = {
      enable = true;
      git = true;
    };
    fzf = {
      enable = true;
      fileWidgetOptions = [ "--preview 'head {}'" ];
      historyWidgetOptions = [ "--sort" ];
    };
    zoxide.enable = true;

    fish = {
      enable = true;
      plugins = [
        # Enable a plugin (here grc for colorized command output) from nixpkgs
        { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      ]
    }
  };
}
