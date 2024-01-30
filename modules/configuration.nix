# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ modulesPath, config, pkgs, lib, ... }:

with lib;

{
  imports = [
    # Include the default lxd configuration.
    "${modulesPath}/virtualisation/lxc-container.nix"
    # Include the container-specific autogenerated configuration.
    ./orbstack.nix
  ];

  networking = {
    hostName = "NixOS";
    useDHCP = true;
    interfaces.eth0.useDHCP = true;
  };

  virtualisation = { docker = { enable = true; }; };

  environment.systemPackages = with pkgs; [
    direnv
    websocat
    zoxide
    fd
    curl
    zellij
    bottom
    tree
    bat
    jq
    gnumake
    ripgrep
    killall
    bun
    lsof
    eza
    starship
    fzf
    # git
    gh
    git
    lazygit
    diff-so-fancy
    # linters & formatters
    nil
    biome
    nixfmt
    deadnix
    # editors
    helix
    neovim
    vscodium
    # (vscode-with-extensions.override {
    #   vscode = vscodium;
    #   vscodeExtensions = with vscode-extensions;
    #     [
    #       # github.copilot
    #       mikestead.dotenv
    #       tamasfe.even-better-toml
    #       bradlc.vscode-tailwindcss
    #       editorconfig.editorconfig
    #       ms-vscode-remote.remote-ssh
    #       christian-kohler.path-intellisense
    #       ms-vscode-remote.vscode-remote-extensionpack
    #     ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
    #       name = "remote-ssh-edit";
    #       publisher = "ms-vscode-remote";
    #       version = "0.47.2";
    #       sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
    #     }];
    # })
  ];

  environment.variables = { EDITOR = "hx"; };

  environment.shells = with pkgs; [ fish ];

  users = { defaultUserShell = pkgs.fish; };

  programs = { fish = { enable = true; }; };

  environment.shellAliases = {

  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

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
    nixos.enable = true;
  };
  environment.noXlibs = false;
}
