{
  modulesPath,
  ghostty,
  pkgs,
  lib,
  ...
}:

with lib;

{
  #
  # nix-ld is specifically so that wrangler can work
  # https://github.com/unlux/workerd/blob/main/docs/nixos.md
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    icu
    nss
    curl
    zlib
    fuse3
    expat
    openssl
    stdenv.cc.cc
  ];

  imports = [
    # Include the default lxd configuration.
    "${modulesPath}/virtualisation/lxc-container.nix"
    # Include the container-specific autogenerated configuration.
    ./lxd.nix
    # Include the container-specific autogenerated configuration.
    ./orbstack.nix
  ];

  time.timeZone = "America/Los_Angeles";

  networking = {
    useDHCP = false;
    dhcpcd.enable = false;
    useHostResolvConf = false;
    interfaces = {
      eth0.useDHCP = true;
    };
  };

  systemd.network = {
    enable = true;
    networks."50-eth0" = {
      matchConfig.Name = "eth0";
      networkConfig = {
        DHCP = "ipv4";
        IPv6AcceptRA = true;
      };
      linkConfig.RequiredForOnline = "routable";
    };
  };

  virtualisation = {
    docker = {
      enable = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      ghostty.packages.${pkgs.system}.default
      git
      age
      curl
      unzip
      glibc
      direnv
      git-lfs
      gnumake
      killall
    ];

    variables = {
      EDITOR = "hx";
      TERM = "xterm-ghostty";
      XDG_CONFIG_HOME = "$HOME/.config";
    };

    shells = with pkgs; [
      fish
    ];
    shellAliases = { };
  };

  programs = {
    fish = {
      enable = true;
    };
  };

  # Extra certificates from OrbStack.
  security.pki.certificates = [
    ''
      -----BEGIN CERTIFICATE-----
      MIICDTCCAbKgAwIBAgIQeXEwUyJzN/MdRJ79MY2AWjAKBggqhkjOPQQDAjBmMR0w
      GwYDVQQKExRPcmJTdGFjayBEZXZlbG9wbWVudDEeMBwGA1UECwwVQ29udGFpbmVy
      cyAmIFNlcnZpY2VzMSUwIwYDVQQDExxPcmJTdGFjayBEZXZlbG9wbWVudCBSb290
      IENBMB4XDTI0MDEwNTE0NDM1MVoXDTM0MDEwNTE0NDM1MVowZjEdMBsGA1UEChMU
      T3JiU3RhY2sgRGV2ZWxvcG1lbnQxHjAcBgNVBAsMFUNvbnRhaW5lcnMgJiBTZXJ2
      aWNlczElMCMGA1UEAxMcT3JiU3RhY2sgRGV2ZWxvcG1lbnQgUm9vdCBDQTBZMBMG
      ByqGSM49AgEGCCqGSM49AwEHA0IABMxlU8hGEWQyJDkneQV5nBz/r+wzL9UYPlAf
      aupq8k/hiW4/nhCM43vNOWmyE9+sw5WYac0hvqc0jdDOs14Xv42jQjBAMA4GA1Ud
      DwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBRIsbuHjpBAlM3G
      wfV/wAKGrjGYATAKBggqhkjOPQQDAgNJADBGAiEA2FD1EdejrBM3HOWXDh5/Lfnd
      z4lVIAB21rrZg+/g2ZACIQCEAnVD2LNnJr2sZLcvfbaaOH3DQRwWbchuyPVrAZ+W
      AQ==
      -----END CERTIFICATE-----

    ''
  ];

  system.stateVersion = "unstable"; # Did you read the comment?
}
