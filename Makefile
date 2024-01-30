default:
	git add . && deadnix && sudo nixos-rebuild switch --flake ".#vm-orb"

fmt:
	nixfmt *.nix **/*.nix --width=100

list-all:
  nixos-option environment.systemPackages
