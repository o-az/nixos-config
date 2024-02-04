# https://mipmip.github.io/home-manager-option-search/?query=programs.direnv

{ ... }: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config = { load_dotenv = true; };
  };
}
