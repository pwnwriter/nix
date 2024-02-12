_default:
	@just -l

nix-clean:
	@nix-collect-garbage -d

nix-rebuild: 
	@home-manager switch --flake . --extra-experimental-features nix-command --extra-experimental-features flakes

