default: build

build:
	$(MAKE) pre
	sudo NIXPKGS_ALLOW_UNFREE=1 NIXPKGS_BROKEN=1 nixos-rebuild switch --flake ".#vm-orb" --print-build-logs --show-trace

upgrade:
	$(MAKE) pre
	sudo NIXPKGS_ALLOW_UNFREE=1 NIXPKGS_BROKEN=1 nixos-rebuild switch --flake ".#vm-orb" --upgrade --print-build-logs --show-trace

pre:
	git add . && deadnix

lint:
	statix check .

fmt:
	nixfmt *.nix **/*.nix **/**/*.nix --width=100
