default:
	git add . && deadnix && sudo NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild switch --flake ".#vm-orb" --show-trace

lint:
	statix check .

fmt:
	nixfmt *.nix **/*.nix **/**/*.nix --width=100
