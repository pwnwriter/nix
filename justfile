set shell := ["zsh", "-c"]

_default:
    @just -l
    @printf "\n"
    @printf "╭──────────────────────────────────────────────╮\n"
    @printf "│  machines                                    │\n"
    @printf "├──────────────────────────────────────────────┤\n"
    @printf "│  phantom    macOS  (Mac Mini)                │\n"
    @printf "│  earlymoon  macOS  (MacBook Air)             │\n"
    @printf "│  wolf       Linux  (Pop OS)                  │\n"
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

# Rebuild a machine: just rebuild <phantom|earlymoon|wolf>
rebuild machine *args:
    @case "{{machine}}" in \
        phantom) \
            just _banner "macOS" ".#phantom"; \
            sudo -H nix run nix-darwin -- switch --flake ".#phantom" --show-trace {{args}} ;; \
        earlymoon) \
            just _banner "macOS" ".#earlymoon"; \
            sudo -H nix run nix-darwin -- switch --flake ".#earlymoon" --show-trace {{args}} ;; \
        wolf) \
            just _banner "Linux" ".#wolf"; \
            nix run home-manager/master -- switch --flake ".#wolf" {{args}} ;; \
        *) \
            echo "Unknown machine: {{machine}}"; \
            echo "Available: phantom, earlymoon, wolf"; \
            exit 1 ;; \
    esac
