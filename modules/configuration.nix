{ modulesPath, pkgs-unstable, lib, ... }:

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

  virtualisation = { docker = { enable = true; }; };

  environment = {
    systemPackages = with pkgs-unstable; [
      fd
      jq
      gh
      nil
      niv
      git
      jump
      curl
      nurl
      pipx
      mods
      atuin
      unzip
      nixfmt
      neovim
      direnv
      statix
      bottom
      ripgrep
      gnumake
      killall
      git-lfs
      lazygit
      deadnix
      nix-tree
      nix-diff
      starship
      nix-init
      asciinema
      nodejs_21
      nix-update
      ripgrep-all
      diff-so-fancy
      coreutils-full
    ];

    variables = {
      EDITOR = "code";
      XDG_CONFIG_HOME = "$HOME/.config";
    };

    shells = with pkgs-unstable; [ fish ];
    shellAliases = { };
  };

  users = { defaultUserShell = pkgs-unstable.fish; };

  programs = { fish = { enable = true; }; };

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
