set shell := ["fish", "-c"]
set dotenv-load := true
set positional-arguments := true

#
# set machine name in .env
# example `VM=".#vm-orb"`

alias b := build
alias pms := permissions

nom := "2>&1 | nom"
export NIXPKGS_BROKEN := "1"
export NIXPKGS_ALLOW_UNFREE := "1"

default: permissions fmt build

build:
    sudo nixos-rebuild switch --flake $VM --upgrade-all --fast --print-build-logs --show-trace {{ nom }}

build-impure:
    sudo nixos-rebuild switch --flake $VM --impure --fast --print-build-logs --show-trace {{ nom }}

build-no-log:
    sudo nixos-rebuild switch --flake $VM {{ nom }}

upgrade:
    sudo nixos-rebuild switch --flake $VM --upgrade --print-build-logs --show-trace {{ nom }}

upgrade-no-log:
    sudo nixos-rebuild switch --flake $VM --upgrade {{ nom }}

upgrade-impure:
    sudo nixos-rebuild switch --flake $VM --upgrade --impure --print-build-logs --show-trace {{ nom }}

remove-fonts:
    sudo rm -rf /etc/fonts

lockup:
    nix flake update

sudo-lockup:
    sudo nix flake update

lint:
    deadnix --no-lambda-pattern-names && statix check .

fmt:
    just --fmt --unstable
    yamlfmt . --formatter
    nixfmt *.nix **/*.nix **/**/*.nix --width=100

fml: fmt lint

permissions:
    sudo chown -R $USER .

[group('cleanup')]
rm-dots:
    sudo find . -type f -name "._*" -exec rm -r {} +
    sudo find . -type f -name "._*" -exec rm -r {} +
    sudo find . -type f -name "._*" -exec rm -r {} +
    sudo find . -type f -name "._*" -exec rm -r {} +
    sudo find . -type f -name "._*" -exec rm -r {} +
    sudo find . -type f -name "._*" -exec rm -r {} +
    sudo find . -type f -name "._*" -exec rm -r {} +

home-manager:
    home-manager switch -b bk
