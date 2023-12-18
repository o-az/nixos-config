{
  users = {
    mutableUsers = false;
    users.o = {
      isNormalUser = true;
      home = "/home/o";
      extraGroups = [ "docker" "wheel" ];
      # shell = pkgs.zsh;
      hashedPassword = "$y$j9T$dHqYv21jcB7S3jBrqffWx1$xUqbav37bG7iWc2A1bFUvPrwTB8.wCUXCZdm1QNb5n2";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGUVfIB/tLqTsawr6wzMxa9TJ0llgFEzSiRyFtDkV/gb"
      ];
    };
  };
}

