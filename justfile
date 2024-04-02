set shell := ["fish", "-c"]
set dotenv-load
set positional-arguments

alias b := build

export VM := ".#vm-orb"
export NIXPKGS_BROKEN := "1"
export NIXPKGS_ALLOW_UNFREE := "1"

default: fmt build

build:
	sudo nixos-rebuild switch --flake $VM --print-build-logs --show-trace

upgrade:
	sudo nixos-rebuild switch --flake $VM --upgrade --print-build-logs --show-trace

update-lockfile:
  sudo nix flake update

lint:
	deadnix && statix check .

fmt:
	nixfmt *.nix **/*.nix **/**/*.nix --width=100
