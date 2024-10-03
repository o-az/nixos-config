{
  modulesPath,
  ghostty,
  pkgs,
  lib,
  ...
}:

with lib;

{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      options = "eurosign:e";
    };
    # displayManager.gdm.wayland = false;
  };
}
