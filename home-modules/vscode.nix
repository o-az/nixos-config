# https://mipmip.github.io/home-manager-option-search/?query=programs.vscode

{
  programs.vscode {
    enable = true;
    enableUpdateCheck = true;
    package = pkgs.vscodium;
    extensions = [
          mikestead.dotenv
          tamasfe.even-better-toml
          bradlc.vscode-tailwindcss
          editorconfig.editorconfig
          ms-vscode-remote.remote-ssh
          christian-kohler.path-intellisense
          ms-vscode-remote.vscode-remote-extensionpack
    ];

  }
}
