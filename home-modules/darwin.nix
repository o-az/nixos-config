{
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
{
  home = {
    stateVersion = "23.11";

    packages = with pkgs; [
      jq
      fd
      gh
      fzf
      git
      tree
      btop
      ripgrep
    ];

    # Hide "last login" message on new terminal.
    file.".hushlogin".text = "";

    # programs.ssh doesn't work well for darwin.
    file.".ssh/config".text = ''
      Host *
        AddKeysToAgent yes
      Include ~/.orbstack/ssh/config
    '';
  };
}
