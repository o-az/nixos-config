# https://home-manager-options.extranix.com/?query=programs.zellij.
{ pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    package = pkgs.zellij;
    # enabling this will enter zellij when starting fish
    enableFishIntegration = false;
  };

  # Nix does not translate nicely to KDL so we use a KDL file instead.
  xdg.configFile."zellij/config.kdl".source = ./config.kdl;
  xdg.configFile."zellij/layouts/default.kdl".source = ./layout.kdl;

  # Needed to let Zellij find SSH_AUTH_SOCK after re-attaching to session
  # cfr: https://github.com/zellij-org/zellij/issues/862#issuecomment-973881560
  # ---------------------------------------------------
  # programs.zsh.initExtra = (if isDarwin then "" else ''
  #   export SSH_AUTH_SOCK="$HOME/.ssh/ssh_auth_sock"
  # '');

  # home.file.".ssh/rc".text = ''
  #   if test "$SSH_AUTH_SOCK"; then
  #     ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
  #   fi
  # '';
  # ---------------------------------------------------
}
