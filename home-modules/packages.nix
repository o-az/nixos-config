{
  pkgs,
  devenv,
  ...
}:
{
  home.packages = with pkgs; [
    devenv.packages.${pkgs.system}.default
    fd
    fx
    yq
    niv
    vhs
    duf
    oha
    pop
    gcc
    dig
    nil
    oha
    gum
    gawk
    melt
    iamb
    entr
    time
    dura
    tldr
    jump
    ctop
    navi
    kmon
    just
    nurl
    walk
    wget
    glow
    mods
    btop
    tmux
    tmate
    taplo
    atuin
    skate
    statix
    fnlfmt
    restish
    deadnix
    gotools
    poppler
    grpcurl
    ripgrep
    termscp
    glances
    lazygit
    termshot
    hadolint
    ast-grep
    nix-tree
    tailspin
    nix-diff
    starship
    superfile
    hyperfine
    fastfetch
    ssh-agents
    zed-editor
    git-extras
    nix-update
    _1password
    lazydocker
    nixpkgs-fmt
    ripgrep-all
    charm-freeze
    diff-so-fancy
    bitwarden-cli
    coreutils-full
    bashInteractive
    nixfmt-rfc-style
  ];
}
