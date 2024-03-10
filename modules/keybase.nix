{ pkgs-unstable, config, lib, ... }:

with lib;

{
  services.keybase = {
    enable = true;
    Unit.Description = "Keybase service";

    Service = {
      ExecStart = "${pkgs-unstable.keybase}/bin/keybase service --auto-forked";
      Restart = "on-failure";
      PrivateTmp = true;
    };

    Install.WantedBy = [ "default.target" ];
  };

  services.kbfs.enable = true;

  systemd.services = {
    keybase = {
      description = "Keybase service";
      after = [ "network.target" ];
      wantedBy = [ "default.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs-unstable.keybase}/bin/keybase service --auto-forked";
        Restart = "on-failure";
        PrivateTmp = true;
      };
    };
  };

  environment.systemPackages = with pkgs-unstable; [
    keybase
  ];

}
