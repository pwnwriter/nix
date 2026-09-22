set shell := ["zsh", "-c"]

_default:
    @just -l
    @printf "\n"
    @printf "╭──────────────────────────────────────────────╮\n"
    @printf "│  machines                                    │\n"
    @printf "├──────────────────────────────────────────────┤\n"
    @printf "│  darlene    macOS  (Mac Mini)                │\n"
    @printf "│  whiterose  macOS  (MacBook M4)              │\n"
    @printf "│  elliot     NixOS  (Precision 7740)          │\n"
    @printf "│  dom        Linux  (Ubuntu server)           │\n"
    @printf "╰──────────────────────────────────────────────╯\n"
    @printf "\n  usage: just r <machine>\n\n"

alias g := gens
alias f := format
alias s := statix
alias c := clean
alias ls := list-system
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

# Clean old generations across ALL profiles (user + system) + store GC, via nh.
# Defaults: keep last 5 generations and anything newer than 14 days.
# nh self-elevates for the system profile. e.g. `just clean 3 7d`.
clean keep="5" since="14d":
    @nh clean all --keep {{keep}} --keep-since {{since}}

# List darwin system generations (the real system-rebuild history).
list-system:
    @sudo nix-env -p /nix/var/nix/profiles/system --list-generations

format:
    @nixfmt $(find ./ -type f -name '*.nix')

statix:
    @statix check .


flake-update:
    @echo "Syncing latest git rev"
    @nix flake update

# Rebuild a machine: just rebuild <darlene|whiterose|elliot|dom>
rebuild machine *args:
    @case "{{machine}}" in \
        darlene) \
            just _banner "macOS" ".#darlene"; \
            nh darwin switch ".#darlene" {{args}} ;; \
        whiterose) \
            just _banner "macOS" ".#whiterose"; \
            nh darwin switch ".#whiterose" {{args}} ;; \
        elliot) \
            just _banner "NixOS" ".#elliot"; \
            nh os switch ".#elliot" {{args}} ;; \
        dom) \
            just _banner "Linux" ".#dom"; \
            nh home switch ".#dom" {{args}} ;; \
        *) \
            echo "Unknown machine: {{machine}}"; \
            echo "Available: darlene, whiterose, elliot, dom"; \
            exit 1 ;; \
    esac
