set shell := ["zsh", "-c"]

_default:
    @just -l

alias g := gens
alias f := format
alias c := clean
alias r := rebuild

gens:
    @echo "🏠🏠🏠 Listing home-manager generations 🏠🏠🏠"
    home-manager generations

# Format all files
format: format-nix format-wezterm
    @echo "🍦🍦🍦Formatted wezterm and nix files 🍦🍦🍦" 

clean:
    @echo "Cleaning up unused Nix store items"
    nix-collect-garbage -d

@format-wezterm:
    stylua $(find ./ -type f -name '.stylua.toml') $(find ./ -type f -name '*.lua')

@format-nix: 
    nixpkgs-fmt $(find ./ -type f -name '*.nix')

[macos]
rebuild:
    @echo "🍎🍎🍎 Rebuilding macOS configuration 🍎🍎🍎"
    nix run github:nix-community/home-manager -- switch --flake .#macos

[linux]
rebuild:
    @echo "🧊🧊🧊 Rebuilding Linux server configuration 🧊🧊🧊"
    nix run github:nix-community/home-manager -- switch --flake .#server

