default:
	git add . && deadnix && sudo nixos-rebuild switch --flake ".#vm-orb"

lint:
	statix check .

fmt:
	nixfmt *.nix **/*.nix **/**/*.nix --width=100
