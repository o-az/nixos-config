set shell := ["fish", "-c"]
set dotenv-load := true
set positional-arguments := true

alias b := build
alias pms := permissions

export VM := ".#vm-orb"
export NIXPKGS_BROKEN := "1"
export NIXPKGS_ALLOW_UNFREE := "1"

default: permissions fmt build

build:
    sudo nixos-rebuild switch --flake $VM --print-build-logs --show-trace

build-impure:
    sudo nixos-rebuild switch --flake $VM --impure --print-build-logs --show-trace

build-no-log:
    sudo nixos-rebuild switch --flake $VM

upgrade:
    sudo nixos-rebuild switch --flake $VM --upgrade --print-build-logs --show-trace

upgrade-no-log:
    sudo nixos-rebuild switch --flake $VM --upgrade

upgrade-impure:
    sudo nixos-rebuild switch --flake $VM --upgrade --impure --print-build-logs --show-trace

remove-fonts:
    sudo rm -rf /etc/fonts

lockup:
    nix flake update

sudo-lockup:
    sudo nix flake update

lint:
    deadnix --no-lambda-pattern-names && statix check .

fmt:
    nixfmt *.nix **/*.nix **/**/*.nix --width=100

fml: fmt lint

permissions:
    sudo chown -R $USER .

[group('cleanup')]
rm-dots:
    sudo find . -type f -name "._*" -exec rm -r {} +

home-manager:
    home-manager switch -b bk
