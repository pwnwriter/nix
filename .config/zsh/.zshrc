setopt autocd interactive_comments

# auto/tab complete
autoload -U compinit && compinit
zmodload zsh/complist
zstyle ':completion:*' menu select

# disable ctrl-s to freeze terminal.
stty stop undef

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

bindkey -s '^f' '^ucd "$(dirname "$(preview)")"\n'
bindkey -s '^v' '^unvim\n'

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/alias" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/alias"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/vi-mode" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/vi-mode"
[ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# shell fancy apps
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
