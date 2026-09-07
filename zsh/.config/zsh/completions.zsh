##
 # Completions
 # :completion:<function>:<completer>:<command>:<argument>:<tag>
 ##

_comp_options+=(globdots)

# which completers to use
zstyle ':completion:*' completer _extensions _complete _approximate

# Don't pollute .config with cache data
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/zcompcache"

# select completions
zstyle ':completion:*' menu select

# Styling
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}- %d -%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple}- %d -%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}- no matches -%f'
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# Don't expand ~
zstyle ':completion:*' keep-prefix true

# Grouping
zstyle ':completion:*' group-name ''

# more information
# zstyle ':completion:*' file-list all

# complete options, not dir stack
zstyle ':completion:*' complete-options true

zmodload zsh/complist
bindkey -M menuselect 'n' accept-and-infer-next-history
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect '^i' vi-insert
