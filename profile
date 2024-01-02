#!/usr/bin/env zsh

# Binaries path
paths=(
	~/.local/bin
	~/.local/share/cargo/bin
	~/.local/share/go/bin
	~/.local/share/hysp/bin
)

for p in "${paths[@]}"; do
	if [ -d "$p" ]; then
		export PATH="$PATH:$p"
	fi
done

export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse # Add sparse index protocol for cargo

# Default programs:
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"

# ~/ Clean-up:
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"

# Configuration file paths
export XINITRC="${XDG_CONFIG_HOME}/x11/xinitrc"
export NOTMUCH_CONFIG="${XDG_CONFIG_HOME}/notmuch-config"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc-2.0"
export WGETRC="${XDG_CONFIG_HOME}/wget/wgetrc"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME}/android"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME}/ansible/ansible.cfg"
export WEECHAT_HOME="${XDG_CONFIG_HOME}/weechat"
export MBSYNCRC="${XDG_CONFIG_HOME}/mbsync/config"
export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/config.toml"

# Data-related directories
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export GOPATH="${XDG_DATA_HOME}/go"
export UNISON="${XDG_DATA_HOME}/unison"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME}/pass"

# Cache-related directories
export HISTFILE="${XDG_CACHE_HOME}/zsh/history"

# Other program settings
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export DICS="/usr/share/stardict/dic/"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS=-R
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export QT_QPA_PLATFORMTHEME="gtk2"
export AWT_TOOLKIT="MToolkit wmname LG3D"

if [ "$(tty)" = "/dev/tty1" ]; then
	exec Hyprland
fi
