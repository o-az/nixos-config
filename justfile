set shell := ["fish", "-c"]
set dotenv-load := true
set positional-arguments := true

#
# set machine name in .env
# example `VM=".#nixos"`

alias b := build
alias pms := permissions

nom := "2>&1 | nom"
export NIXPKGS_BROKEN := "1"
export NIXPKGS_ALLOW_UNFREE := "1"

default: permissions fmt build

[group('build-macos')]
build-macos:
    sudo nix run nix-darwin -- switch --flake $VM --print-build-logs --show-trace {{ nom }}

[group('build-darwin')]
upgrade-macos:
    sudo darwin-rebuild switch --flake $VM --upgrade --print-build-logs --show-trace {{ nom }}

[group('build-nixos')]
build:
    sudo nixos-rebuild switch \
      --flake $VM \
      --upgrade-all \
      --print-build-logs \
      --show-trace {{ nom }}

[group('build-nixos')]
build-impure:
    sudo nixos-rebuild switch --flake $VM --impure --fast --print-build-logs --show-trace {{ nom }}

[group('build-nixos')]
build-no-log:
    sudo nixos-rebuild switch --flake $VM {{ nom }}

[group('build-nixos')]
upgrade:
    sudo nixos-rebuild switch --flake $VM --upgrade --print-build-logs --show-trace {{ nom }}

[group('build-nixos')]
upgrade-no-log:
    sudo nixos-rebuild switch --flake $VM --upgrade {{ nom }}

[group('build-nixos')]
upgrade-impure:
    sudo nixos-rebuild switch --flake $VM --upgrade --impure --print-build-logs --show-trace {{ nom }}

remove-fonts:
    sudo rm -rf /etc/fonts

[group('update')]
lockup:
    nix flake update

[group('update')]
sudo-lockup:
    sudo nix flake update

[group('lint')]
lint:
    deadnix --no-lambda-pattern-names && statix check .

[group('lint')]
fmt:
    just --fmt --unstable
    yamlfmt . --formatter
    fish_indent --write **/*.fish
    nixfmt *.nix **/*.nix **/**/*.nix --width=100

[group('lint')]
fml: fmt lint

home-manager:
    home-manager switch -b bk

permissions:
    sudo chown -R $USER .

[group('brew')]
homebrew-list-brews:
    brew info --json --installed | jq '[.[].name] | sort_by(length)'

[group('brew')]
homebrew-list-casks:
    brew info --cask --installed --json=v2 | jq '[.casks[].token] | sort_by(length)'

[group('cleanup')]
rm-dots:
    sudo find . -type f -name "._*" -exec rm -r {} +
    sudo find . -type f -name "._*" -exec rm -r {} +
    sudo find . -type f -name "._*" -exec rm -r {} +
    sudo find . -type f -name "._*" -exec rm -r {} +
    sudo find . -type f -name "._*" -exec rm -r {} +
    sudo find . -type f -name "._*" -exec rm -r {} +
    sudo find . -type f -name "._*" -exec rm -r {} +
