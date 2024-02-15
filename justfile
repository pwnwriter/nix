_default:
	@just -l

nix-clean:
	@nix-collect-garbage -d

nix-rebuild: 
	@nix run nix-darwin -- switch --flake .#pwnwriter && darwin-rebuild switch --flake .#pwnwriter
