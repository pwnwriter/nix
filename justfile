_default:
	@just -l

gens:
        @home-manager generations 

format: 
        @nixpkgs-fmt ./

clean:
	@nix-collect-garbage -d

rebuild *ARGS: 
	@nix run github:nix-community/home-manager -- switch --flake .#{{ARGS}}

