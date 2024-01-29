default:
	git add . && sudo nixos-rebuild switch --flake ".#vm-orb"

fmt:
	nixfmt *.nix **/*.nix
