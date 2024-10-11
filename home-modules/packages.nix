{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
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
    dive
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
    distrobox
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
    distrobox-tui
    diff-so-fancy
    bitwarden-cli
    coreutils-full
    bashInteractive
    nixfmt-rfc-style
  ];
}
