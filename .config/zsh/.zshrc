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

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/vi-mode" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/vi-mode"
[ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

bindkey -s '^v' '^unvim . \n'
bindkey -s '^f' '^ucd "$(dirname "$(preview)")"\n'

# shell gud apps
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
