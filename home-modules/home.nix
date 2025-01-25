{ pkgs, config, ... }:
{
  home.username = "o";
  programs = {
    home-manager.enable = true;

    nix-index = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    eza = {
      git = true;
      enable = true;
      icons = "auto";
      package = pkgs.eza;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    fzf = {
      enable = true;
      package = pkgs.fzf;
      enableBashIntegration = true;
      enableFishIntegration = false;
    };
    broot = {
      enable = true;
      package = pkgs.broot;
      enableBashIntegration = true;
      enableFishIntegration = false;
      enableNushellIntegration = true;
    };
    dircolors = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = false;
    };
    zoxide = {
      enable = true;
      package = pkgs.zoxide;
      enableBashIntegration = true;
      enableFishIntegration = false;
      enableNushellIntegration = true;
    };
  };
}
