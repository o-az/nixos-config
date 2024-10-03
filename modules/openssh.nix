# https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=services.openssh.
_: {
  services.openssh = {
    enable = true;
    ports = [ 2222 ];
    banner = ''
      welcome to hell
    '';
    authorizedKeysFiles = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJNMtRVUTD0g9VNsHXK3EpDrgyndSAFbLqNmTEtJRfJI"
    ];
    settings = {
      X11Forwarding = true;
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = true;
    };
  };
}
