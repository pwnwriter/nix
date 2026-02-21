set shell := ["zsh", "-c"]

_default:
    @just -l

alias g := gens
alias f := format
alias c := clean
alias r := rebuild
alias u := flake-update

# --- helpers -------------------------------------------------

# Pretty header (private helper)
_banner os flake:
    @host="$$(hostname -s 2>/dev/null || hostname)"; \
    printf "\n"; \
    printf "╭──────────────────────────────────────────────╮\n"; \
    printf "│  %-44s│\n" "$$host :: {{os}}"; \
    printf "│  %-44s│\n" "flake: {{flake}}"; \
    printf "╰──────────────────────────────────────────────╯\n\n"

# --- tasks ---------------------------------------------------

gens:
    @echo "🏠🏠🏠 Listing home-manager generations 🏠🏠🏠"
    @nix-env --list-generations

clean:
    @echo "Cleaning up unused Nix store items"
    @nix-collect-garbage -d

format:
    @nixfmt $(find ./ -type f -name '*.nix')
    @stylua -f $(find . -type f -name '.stylua.toml') $(find . -type f -name '*.lua')

flake-update:
    @echo "Syncing latest git rev"
    @nix flake update

# Rebuild configuration
[macos]
rebuild *args:
    @just _banner "macOS" ".#earlymoon"
    @sudo -H nix run nix-darwin -- switch --flake .#earlymoon --show-trace {{args}}

[linux]
rebuild *args:
    @just _banner "Linux" ".#wolf"
    @nix run home-manager/master -- switch --flake .#wolf {{args}}
