{ pkgs, ... }:

{
  services.xserver = {
    enable = false;
    desktopManager = {
      xfce.enable = false;
    };
    xkb = {
      layout = "us";
      options = "eurosign:e";
    };
    displayManager.gdm = {
      enable = false;
      wayland = false;
    };
  };
}
