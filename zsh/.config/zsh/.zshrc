##
 # zsh interactive
 # deflating zsh, keeping it small&clean. No bloat. No ohmyzsh.
 # ohmyzsh is a huge framework of which I will use at most 1 % of the functionality.
 # zsh itself is complicated enough.
 ##

source "$ZDOTDIR/options"

# zsh doesnt't create .cache/zsh by itself
zstyle :compinstall filename '${ZDOTDIR}/.zshrc'
autoload -Uz compinit; compinit -d "$HOME/.cache/zsh/zcompdump"
source "$ZDOTDIR/completions.zsh"


source "${ZDOTDIR}/aliases"


##
 # doesn't have to look ugly tho
 ##

autoload -U promptinit
fpath=("$ZDOTDIR/themes" "$fpath[@]")
promptinit
prompt clean
cat "$HOME/.cache/wal/sequences"


##
 # fix some keys
 # slash as delimiter
 ##

bindkey '^[[H'  beginning-of-line
bindkey '^[[F'  end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
autoload -U select-word-style
select-word-style bash


##
 # Edit commands in editor
 # very useful on long, complicated cmds like ffmpeg,qemu
 ##

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line


##
 # bin paths in interactive use
 ##

path+=("$HOME/cross/tools/bin")
path+=("$HOME/.local/scripts")
path+=("$HOME/.local/bin")
export PATH


##
 # vimmmm mappppping
 ##

bindkey -v
export KEYTIMEOUT=1


##
 # fzf
 # useful & powerful
 # under /usr/share/zsh/site-functions/_fzf
 # should be already in fpath
 ##

autoload -Uz _fzf
_fzf
source /usr/share/fzf/shell/key-bindings.zsh


##
 # autosuggestions
 ##

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY='history'
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20


##
 # syntax + highlighting = syntax-highlighting
 # at the end of zshrc pls
 ##

source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
