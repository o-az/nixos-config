{
  security.sudo.wheelNeedsPassword = false;
  users = {
    mutableUsers = false;
    users.omar = {
      group = "users";
      homeMode = "700";
      createHome = true;
      home = "/home/omar";
      # simulate isNormalUser, but with an arbitrary UID
      isSystemUser = true;
      useDefaultShell = true;

      extraGroups = [
        "wheel"
        "docker"
      ];
      hashedPassword = "$y$j9T$dHqYv21jcB7S3jBrqffWx1$xUqbav37bG7iWc2A1bFUvPrwTB8.wCUXCZdm1QNb5n2";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO1YmsLW3HzJZmw2iz3ii0y+zy3IRM0lcKZW04lms2dC"
      ];
    };
  };
}
