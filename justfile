_default:
	@just -l

nix-clean:
	@nix-collect-garbage -d

nix-rebuild: 
	@nix run github:nix-community/home-manager -- switch --flake .#pwnwriter 
