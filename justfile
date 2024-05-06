_default:
    @just -l

alias g := gens
alias f := format
alias c := clean
alias r := rebuild

gens:
    @echo "Listing home-manager generations"
    @home-manager generations

format:
    @echo "Formatting nix files"
    @nixpkgs-fmt $(find ./ -type f -name '*.nix')
    @echo "Formatting wezterm lua files"
    @stylua $(find ./ -type f -name '.stylua.toml') $(find ./ -type f -name '*.lua')

clean:
    @echo "Cleaning up unused Nix store items"
    @nix-collect-garbage -d

[macos]
rebuild:
    @echo "Rebuilding macOS configuration"
    @nix run github:nix-community/home-manager -- switch --flake .#macos

[linux]
rebuild:
    @echo "Rebuilding Linux server configuration"
    @nix run github:nix-community/home-manager -- switch --flake .#server

