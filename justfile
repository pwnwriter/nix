_default:
    @just -l

alias g := gens
alias f := format
alias c := clean
alias r := rebuild

gens:
    @home-manager generations 

format:
    @nixpkgs-fmt ./

clean:
    @nix-collect-garbage -d

rebuild *ARGS:
    @nix run github:nix-community/home-manager -- switch --flake .#{{ ARGS }}
