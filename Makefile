default:
	git add . && deadnix && sudo nixos-rebuild switch --flake ".#vm-orb"

lint:
	git add . && statix check .

fmt:
	git add . && nixfmt *.nix **/*.nix **/**/*.nix --width=100
