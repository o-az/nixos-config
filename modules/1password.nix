# https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=1password.
{ pkgs, ... }:
{
  programs._1password = {
    enable = true;
    package = pkgs._1password-cli;
  };
}
