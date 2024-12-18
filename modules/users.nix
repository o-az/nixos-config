{ pkgs, ... }:
{
  security.sudo.wheelNeedsPassword = false;
  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.fish;
    users.o = {
      # isNormalUser = true;
      uid = 501;
      group = "users";
      homeMode = "700";
      createHome = true;
      home = "/home/o";
      # simulate isNormalUser, but with an arbitrary UID
      isSystemUser = true;
      useDefaultShell = true;
      shell = pkgs.fish;
      extraGroups = [
        "docker"
        "wheel"
      ];
      hashedPassword = "$y$j9T$dHqYv21jcB7S3jBrqffWx1$xUqbav37bG7iWc2A1bFUvPrwTB8.wCUXCZdm1QNb5n2";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJNMtRVUTD0g9VNsHXK3EpDrgyndSAFbLqNmTEtJRfJI"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJweyVEQv8a6t9p4magdhQcah9yqADTxkkG5+svwSkBL"

        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDNyROH/lWSYGnwkMmmDqsjIFjo4zv/N4HHQS9GVxPLn"
      ];
    };
  };
}
