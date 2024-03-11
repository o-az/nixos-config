# Generated by OrbStack.
# This MAY be overwritten in the future. Make a copy and update the include
# in configuration.nix if you want to keep your changes.

{ lib, ... }:

with lib;

{

  # sudoers
  security.sudo.extraRules = [{
    users = [ "omar" ];
    commands = [{
      command = "ALL";
      options = [ "NOPASSWD" ];
    }];
  }];

  # add OrbStack CLI tools to PATH
  environment.shellInit = ''
    . /opt/orbstack-guest/etc/profile-early
    # add your customizations here
    . /opt/orbstack-guest/etc/profile-late
  '';

  time.timeZone = "America/Los_Angeles";

  # faster DHCP - OrbStack uses SLAAC exclusively
  networking.dhcpcd.extraConfig = ''
    noarp
    noipv6
  '';

  # disable sshd
  services.openssh.enable = false;

  systemd = {
    services = {
      "systemd-oomd".serviceConfig.WatchdogSec = 0;
      "systemd-resolved".serviceConfig.WatchdogSec = 0;
      "systemd-userdbd".serviceConfig.WatchdogSec = 0;
      "systemd-udevd".serviceConfig.WatchdogSec = 0;
      "systemd-timesyncd".serviceConfig.WatchdogSec = 0;
      "systemd-timedated".serviceConfig.WatchdogSec = 0;
      "systemd-portabled".serviceConfig.WatchdogSec = 0;
      "systemd-nspawn@".serviceConfig.WatchdogSec = 0;
      "systemd-networkd".serviceConfig.WatchdogSec = 0;
      "systemd-machined".serviceConfig.WatchdogSec = 0;
      "systemd-localed".serviceConfig.WatchdogSec = 0;
      "systemd-logind".serviceConfig.WatchdogSec = 0;
      "systemd-journald@".serviceConfig.WatchdogSec = 0;
      "systemd-journald".serviceConfig.WatchdogSec = 0;
      "systemd-journal-remote".serviceConfig.WatchdogSec = 0;
      "systemd-journal-upload".serviceConfig.WatchdogSec = 0;
      "systemd-importd".serviceConfig.WatchdogSec = 0;
      "systemd-hostnamed".serviceConfig.WatchdogSec = 0;
      "systemd-homed".serviceConfig.WatchdogSec = 0;
    };
  };

  # ssh config
  programs.ssh.extraConfig = ''
    Include /opt/orbstack-guest/etc/ssh_config
  '';

  # extra certificates
  security.pki.certificateFiles = [ "/opt/orbstack-guest/run/extra-certs.crt" ];

  # indicate builder support for emulated architectures
  nix.extraOptions = "extra-platforms = x86_64-linux i686-linux";
}
