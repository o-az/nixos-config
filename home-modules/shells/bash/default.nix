# https://home-manager-options.extranix.com/?query=programs.bash.
{
  pkgs,
  ...
}:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    package = pkgs.bashInteractive;
    bashrcExtra = ''
      eval "$(starship init bash)"

      eval "$(direnv hook bash)"
    '';
    shellAliases = import ../aliases.nix;
  };
}
