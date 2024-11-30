# https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=services.openssh.
_: {
  services.openssh = {
    enable = false;
    ports = [ 2222 ];
    banner = ''
      welcome to hell
    '';
    authorizedKeysFiles = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJNMtRVUTD0g9VNsHXK3EpDrgyndSAFbLqNmTEtJRfJI"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJweyVEQv8a6t9p4magdhQcah9yqADTxkkG5+svwSkBL"

      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDNyROH/lWSYGnwkMmmDqsjIFjo4zv/N4HHQS9GVxPLn"
    ];
    settings = {
      X11Forwarding = true;
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = true;
    };
  };
}
