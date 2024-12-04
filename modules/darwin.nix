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

  nix.settings.trusted-users = [ user ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system = {
    stateVersion = 5;
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      menuExtraClock.Show24Hour = true; # show 24 hour clock

      # other macOS's defaults configuration.
      # ......
    };
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  programs.zsh.enable = true;
}
