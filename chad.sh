#!/usr/bin/env zsh

# @PwnWriter // WTFPL LICENSE

# Dirs
config_directories=("alacritty" "cava" "heliumbar" "hysp" "nvim" "tmux" "zathura" "bat" "git" "hypr" "starship" "wofi" "zsh")
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOME_DIR="$HOME"

# Create symbolic links
create_symlink() {
    local source="$1"
    local target="$2"
    if [ -e -f "$target" ]; then
        echo "Removing existing $target"
        rm -rf "$target"
    fi
    echo "Creating symbolic link for $source"
    ln -s "$source" "$target"
}

for dir in "${config_directories[@]}"; do
    create_symlink "$SCRIPT_DIR/config/$dir" "$HOME_DIR/.config/$dir"
done

create_symlink "$SCRIPT_DIR/profile" "$HOME_DIR/.zprofile"

create_symlink "$SCRIPT_DIR/local/bin" "$HOME_DIR/.local/bin"

create_symlink "$SCRIPT_DIR/local/share/pass" "$HOME_DIR/.local/share/pass"
