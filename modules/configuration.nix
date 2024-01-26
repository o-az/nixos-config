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

  networking.hostName = "NixOS";
  virtualisation = { docker = { enable = true; }; };

  networking.useDHCP = false;
  networking.interfaces.eth0.useDHCP = true;

  environment.systemPackages = with pkgs; [
    diff-so-fancy
    direnv
    neovim
    websocat
    zoxide
    wget
    curl
    lazygit
    zellij
    helix
    nixfmt
    gh
    bottom
    tree
    bat
    jq
    gnumake
    git
    ripgrep
    lsof
    eza
    starship
    fzf
  ];

  environment.variables = { EDITOR = "hx"; };

  environment.shells = with pkgs; [ fish ];

  users.defaultUserShell = pkgs.fish;

  programs.fish = { enable = true; };

  environment.shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    ga = "git add --all";
    gs = "git status";
    gcm = "git commit -S -m";
    gp = "git push";
    glog = "git log --graph --decorate --pretty=oneline --abbrev-commit";
    ls =
      "eza --oneline --icons --all --group-directories-first --color=auto --sort=modified";
    myip = "curl http://ipecho.net/plain; echo";
    dnscheck = "curl https://am.i.mullvad.net/json | jq";
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
  documentation.enable = true;
  documentation.nixos.enable = true;
  environment.noXlibs = false;
}
