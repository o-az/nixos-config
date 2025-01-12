# Generated by OrbStack.
# This MAY be overwritten in the future. Make a copy and update the include
# in configuration.nix if you want to keep your changes.

{
  lib,
  config,
  ...
}:

with lib;

{

  # Add OrbStack CLI tools to PATH
  environment.shellInit = ''
    . /opt/orbstack-guest/etc/profile-early

    # add your customizations here

    . /opt/orbstack-guest/etc/profile-late
  '';

  # sudoers
  security.sudo.extraRules = [
    {
      users = [ "o" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  #
  # orbstack defaults
  #

  # Enable documentation
  documentation = {
    enable = true;
    man.enable = true;
    dev.enable = false;
    doc.enable = false;
    info.enable = false;
    nixos.enable = true;
  };

  # Disable systemd-resolved
  services.resolved.enable = false;
  environment.etc."resolv.conf".source = "/opt/orbstack-guest/etc/resolv.conf";

  # faster DHCP - OrbStack uses SLAAC exclusively
  networking.dhcpcd.extraConfig = ''
    noarp
    noipv6
  '';

  # disable sshd
  # services.openssh.enable = false;

  systemd = {
    network.wait-online.enable = false;
    services = {
      "systemd-oomd".serviceConfig.WatchdogSec = 0;
      "systemd-homed".serviceConfig.WatchdogSec = 0;
      "systemd-udevd".serviceConfig.WatchdogSec = 0;
      "systemd-logind".serviceConfig.WatchdogSec = 0;
      "systemd-importd".serviceConfig.WatchdogSec = 0;
      "systemd-nspawn@".serviceConfig.WatchdogSec = 0;
      "systemd-localed".serviceConfig.WatchdogSec = 0;
      "systemd-userdbd".serviceConfig.WatchdogSec = 0;
      "systemd-resolved".serviceConfig.WatchdogSec = 0;
      "systemd-machined".serviceConfig.WatchdogSec = 0;
      "systemd-journald".serviceConfig.WatchdogSec = 0;
      "systemd-timesyncd".serviceConfig.WatchdogSec = 0;
      "systemd-timedated".serviceConfig.WatchdogSec = 0;
      "systemd-portabled".serviceConfig.WatchdogSec = 0;
      "systemd-hostnamed".serviceConfig.WatchdogSec = 0;
      "systemd-journald@".serviceConfig.WatchdogSec = 0;
      "systemd-journal-remote".serviceConfig.WatchdogSec = 0;
      "systemd-journal-upload".serviceConfig.WatchdogSec = 0;
      "systemd-networkd".serviceConfig.WatchdogSec = lib.mkIf config.systemd.network.enable 0;
    };
  };

  # ssh config
  programs.ssh = {
    setXAuthLocation = true;
    extraConfig = ''
      Include /opt/orbstack-guest/etc/ssh_config
    '';
  };
  # extra certificates
  # security.pki.certificateFiles = [
  #   "/opt/orbstack-guest/run/extra-certs.crt"
  # ];

  # indicate builder support for emulated architectures
  nix.settings.extra-platforms = [
    "x86_64-linux"
    "i686-linux"
  ];
}
