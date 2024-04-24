_default:
    @just -l

alias g := gens
alias f := format
alias c := clean
alias r := rebuild

gens:
    @home-manager generations 

format:
    @nixpkgs-fmt $(find ./ -type f -name '*.nix')

clean:
    @nix-collect-garbage -d

[macos]
rebuild:
    @nix run github:nix-community/home-manager -- switch --flake .#macos

[linux]
rebuild:
    @nix run github:nix-community/home-manager -- switch --flake .#server
