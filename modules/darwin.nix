{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.nix-daemon.enable = true;
  environment = {
    systemPackages = with pkgs; [
      gh
      age
      curl
      unzip
      cmake
      glibc
      direnv
      git-lfs
      gnumake
      killall
    ];

    shells = [ pkgs.fish ];

  };

  networking =
    let
      name = "rekt";
    in
    {
      hostName = name;
      computerName = name;
      localHostname = name;
    };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
