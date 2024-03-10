{ pkgs-unstable, config, lib, ... }:

with lib;

{
  services.kbfs.enable = true;
  services.keybase.enable = true;
  environment.systemPackages = with pkgs-unstable; [ keybase ];

}
