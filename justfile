set shell := ["fish", "-c"]
set dotenv-load
set positional-arguments

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

update-lockfile:
  sudo nix flake update

lint:
	deadnix && statix check .

fmt:
	nixfmt *.nix **/*.nix **/**/*.nix --width=100

fml: fmt lint

permissions:
  sudo chown -R $USER .
