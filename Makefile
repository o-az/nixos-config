default:
	git add . && deadnix && sudo nixos-rebuild switch --flake ".#vm-orb"

fmt:
	git add . && nixfmt *.nix **/*.nix **/**/*.nix --width=100
