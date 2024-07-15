{
  modulesPath,
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
    ./orbstack.nix
  ];

  networking = {
    hostName = "nixos";
    useDHCP = true;
    interfaces.eth0.useDHCP = true;
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
        fd
        fx
        jq
        fh
        yq
        gh
        niv
        git
        oha
        wtf
        gcc
        dig
        age
        jrnl
        jump
        curl
        kmon
        nixd
        just
        nurl
        walk
        # yazi
        btop
        xplr
        delta
        ngrok
        atuin
        unzip
        jless
        trippy
        direnv
        kalker
        poppler
        grpcurl
        gh-dash
        ripgrep
        termscp
        gnumake
        hadolint
        killall
        git-lfs
        lazygit
        zathura
        ast-grep
        nix-tree
        tailspin
        nix-diff
        starship
        nix-init
        localsend
        lazydocker
        # tailscale
        superfile
        fastfetch
        bandwhich
        # asciinema
        nix-update
        ripgrep-all
        openapi-tui
        diff-so-fancy
        coreutils-full
        # wireguard-tools
        nil
        biome
        taplo
        serve
        gopls
        cspell
        fnlfmt
        statix
        devenv
        deadnix
        gotools
        proselint
        cloudflared
        nixpkgs-fmt
        openscad-lsp
        nixfmt-rfc-style
        # yaml-language-server
        # delve
        # revive
        # freeze
        # write-good
        # solargraph
        # terraform-ls
        # golangci-lint
        # golangci-lint-langserver
        nodePackages_latest.sass
        vscode-json-languageserver
        # typescript-language-server
        sumneko-lua-language-server
        vscode-langservers-extracted
        nodePackages_latest.typescript
        nodePackages.bash-language-server
      ];

    variables = {
      EDITOR = "hx";
      XDG_CONFIG_HOME = "$HOME/.config";
    };

    shells = with pkgs; [ fish ];
    shellAliases = { };
  };

  users = {
    defaultUserShell = pkgs.fish;
  };

  programs = {
    fish = {
      enable = true;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

  # As this is intended as a stadalone image, undo some of the minimal profile stuff
  documentation = {
    enable = true;
    man.enable = true;
    dev.enable = false;
    doc.enable = false;
    info.enable = false;
    nixos.enable = true;
  };
  environment.noXlibs = false;
}
