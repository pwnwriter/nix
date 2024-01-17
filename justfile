_default:
	@just -l

nix-clean:
	@doas nix-collect-garbage -d

nix-rebuild: 
	@doas nixos-rebuild switch --flake .#laptop
