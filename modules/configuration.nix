{
  modulesPath,
  ghostty,
  pkgs,
  lib,
  ...
}:

with lib;

{
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
    systemPackages =
      with pkgs;
      with pkgs.nodePackages_latest;
      [
        ghostty.packages.${pkgs.system}.default
        fd
        fx
        jq
        yq
        niv
        duf
        git
        oha
        gcc
        dig
        nil
        age
        yazi
        time
        dura
        tldr
        jump
        curl
        ctop
        navi
        kmon
        nixd
        just
        nurl
        walk
        btop
        wget
        taplo
        tmate
        atuin
        unzip
        direnv
        fnlfmt
        statix
        devenv
        deadnix
        gotools
        poppler
        grpcurl
        gh-dash
        ripgrep
        termscp
        gnumake
        killall
        git-lfs
        lazygit
        glances
        termshot
        hadolint
        ast-grep
        nix-tree
        tailspin
        nix-diff
        starship
        superfile
        fastfetch
        # zed-editor
        git-extras
        lazydocker
        nix-update
        _1password
        nixpkgs-fmt
        ripgrep-all
        diff-so-fancy
        bitwarden-cli
        coreutils-full
        nixfmt-rfc-style
        nodePackages.bash-language-server
        # jrnl
        # xplr
        # biome
        # serve
        # gopls
        # jless
        # trippy
        # kalker
        # zathura
        # bore-cli
        # proselint
        # localsend
        # openapi-tui
        # openscad-lsp
        # nodePackages_latest.sass
        # vscode-json-languageserver
        # sumneko-lua-language-server
        # vscode-langservers-extracted
        # nodePackages_latest.typescript
      ];

    variables = {
      EDITOR = "hx";
      TERM = "xterm-ghostty";
      XDG_CONFIG_HOME = "$HOME/.config";
    };

    shells = with pkgs; [ fish ];
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

  environment.noXlibs = false;
}
