set shell := ["zsh", "-c"]

_default:
    @just -l

alias g := gens
alias f := format
alias c := clean
alias r := rebuild

# List all generations
gens:
    @echo "🏠🏠🏠 Listing home-manager generations 🏠🏠🏠"
    @nix-env --list-generations

#Cleans up garbage
clean:
    @echo "Cleaning up unused Nix store items"
    @nix-collect-garbage -d

# Format all files
format:
    @nixfmt $(find ./ -type f -name '*.nix')

# Rebuild configuration
[macos]
rebuild:
    @echo "🍎🍎🍎 Rebuilding macOS configuration 🍎🍎🍎"
    @nix run nix-darwin -- switch --flake .#wood
