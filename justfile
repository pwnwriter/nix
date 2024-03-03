_default:
	@just -l

gens:
        @home-manager generations 

clean:
	@nix-collect-garbage -d

rebuild *ARGS: 
	@nix run github:nix-community/home-manager -- switch --flake .#{{ARGS}}

