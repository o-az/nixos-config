# https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=tailscale..
{ pkgs, ... }:
{
  services.tailscale.enable = true;
  services.tailscale.package = pkgs.tailscale;
}
