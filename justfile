set shell := ["zsh", "-c"]

_default:
    @just -l
    @printf "\n"
    @printf "╭──────────────────────────────────────────────╮\n"
    @printf "│  machines                                    │\n"
    @printf "├──────────────────────────────────────────────┤\n"
    @printf "│  darlene    macOS  (Mac Mini)                │\n"
    @printf "│  whiterose  macOS  (MacBook M4)              │\n"
    @printf "│  elliot     Linux  (Pop OS)                  │\n"
    @printf "│  fsoc       Linux  (ThinkCenter)             │\n"
    @printf "╰──────────────────────────────────────────────╯\n"
    @printf "\n  usage: just r <machine>\n\n"

alias g := gens
alias f := format
alias s := statix
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

statix:
    @statix check .


flake-update:
    @echo "Syncing latest git rev"
    @nix flake update

# Rebuild a machine: just rebuild <darlene|whiterose|elliot|fsoc>
rebuild machine *args:
    @case "{{machine}}" in \
        darlene) \
            just _banner "macOS" ".#darlene"; \
            sudo -H nix run nix-darwin -- switch --flake ".#darlene" --show-trace {{args}} ;; \
        whiterose) \
            just _banner "macOS" ".#whiterose"; \
            sudo -H nix run nix-darwin -- switch --flake ".#whiterose" --show-trace {{args}} ;; \
        elliot) \
            just _banner "Linux" ".#elliot"; \
            nix run home-manager/master -- switch --flake ".#elliot" {{args}} ;; \
        fsoc) \
            just _banner "Linux" ".#fsoc"; \
            nix run home-manager/master -- switch --flake ".#fsoc" {{args}} ;; \
        *) \
            echo "Unknown machine: {{machine}}"; \
            echo "Available: darlene, whiterose, elliot, fsoc"; \
            exit 1 ;; \
    esac
