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
alias ca := clean-all
alias co := clean-old
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

# Light clean: trim THIS USER's old generations + GC.
# NOTE: does NOT touch the system profile (the darwin-rebuild history).
clean:
    @echo "🧹 Cleaning user profile generations + store garbage"
    @nix-collect-garbage -d

# Deep clean: trim user AND system (darwin) generations, then optimise.
# This is the one that clears the pile of darwin-rebuild system generations.
clean-all:
    @echo "🧹 Cleaning user + system generations + store garbage"
    nix-collect-garbage -d
    sudo nix-collect-garbage -d
    @echo "🗜  Optimising store"
    nix store optimise

# Age-based clean: drop everything older than N days (default 14), user + system.
clean-old days="14":
    @echo "🧹 Removing generations older than {{days}} days (user + system)"
    nix-collect-garbage --delete-older-than {{days}}d
    sudo nix-collect-garbage --delete-older-than {{days}}d

# Trim only the darwin system profile to the last N generations (default 5).
clean-system keep="5":
    @echo "🧹 Keeping last {{keep}} system generations"
    sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +{{keep}}
    sudo nix-collect-garbage

# List darwin system generations (the real darwin-rebuild history).
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
            sudo -H nix run nix-darwin -- switch --flake ".#darlene" --show-trace {{args}} ;; \
        whiterose) \
            just _banner "macOS" ".#whiterose"; \
            sudo -H nix run nix-darwin -- switch --flake ".#whiterose" --show-trace {{args}} ;; \
        elliot) \
            just _banner "NixOS" ".#elliot"; \
            sudo nixos-rebuild switch --flake ".#elliot" --show-trace {{args}} ;; \
        dom) \
            just _banner "Linux" ".#dom"; \
            nix run home-manager/master -- switch --flake ".#dom" {{args}} ;; \
        *) \
            echo "Unknown machine: {{machine}}"; \
            echo "Available: darlene, whiterose, elliot, dom"; \
            exit 1 ;; \
    esac
