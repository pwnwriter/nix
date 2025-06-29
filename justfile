set shell := ["zsh", "-c"]

_default:
    @just -l

alias g := gens
alias f := format
alias c := clean
alias r := rebuild
alias u := flake-update

# List all generations
gens:
    @echo "🏠🏠🏠 Listing home-manager generations 🏠🏠🏠"
    @nix-env --list-generations

# Cleans up garbage
clean:
    @echo "Cleaning up unused Nix store items"
    @nix-collect-garbage -d

# Format all files
format:
    @nixfmt $(find ./ -type f -name '*.nix')
    @stylua -f $(find . -type f -name '.stylua.toml') $(find . -type f  -name '*.lua')

# Update flake git revision
flake-update:
    @echo "Syncing latest git rev"
    @nix flake update

# Rebuild configuration
[macos]
rebuild:
    @echo "🍎🍎🍎 Rebuilding macOS configuration 🍎🍎🍎"
    @sudo nix run nix-darwin -- switch --flake .#earlymoon --show-trace


