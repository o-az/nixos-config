{ pkgs, config, lib, ... }:

with lib;

let cfg = config.within.keybase;
in {
  options.within.keybase.enable = mkEnableOption "Enable keybase/kbfs support";
  config = mkIf cfg.enable {
    services.keybase.enable = true;
    services.kbfs.enable = true;
    home.packages = [ pkgs.keybase ];
  };
}
