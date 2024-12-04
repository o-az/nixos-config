{
  lib,
  pkgs,
  user,
  config,
  ...
}:

{
  users.users.o = {
    name = "o";
    home = "/Users/o";
  };
  services.nix-daemon.enable = true;
  environment = {
    systemPackages = with pkgs; [
      gh
      age
      curl
      unzip
      cmake
      # glibc
      direnv
      git-lfs
      gnumake
      killall
    ];

    shells = [ pkgs.fish ];

  };

  networking =
    let
      name = "o";
    in
    {
      hostName = name;
      computerName = name;
      localHostName = name;
    };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
