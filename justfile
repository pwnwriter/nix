_default:
	@just -l

nix-clean:
	@nix-collect-garbage -d

nix-rebuild: 
	@home-manager switch --flake .
