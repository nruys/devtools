function zsh_source_scripts()
{
  . ~/.bash_aliases
  . ~/.bash_env
  if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi
}

function zsh_set_options()
{
  setopt autocd
  setopt autopushd
  setopt histsavenodups
  setopt histexpiredupsfirst
  setopt histfindnodups
  setopt histignorealldups
  setopt histignoredups
  setopt histreduceblanks
  setopt nullglob
  setopt pushdignoredups
  setopt pushdtohome
  setopt promptcr
  setopt promptsubst
  setopt zle

  autoload -U promptinit
  autoload -U compinit
  compinit -C
  promptinit
  prompt wunjo

  bindkey -v
  bindkey '^R' history-incremental-search-backward

  autoload edit-command-line
  zle -N edit-command-line
  bindkey -M vicmd v edit-command-line

  ## case-insensitive (all),partial-word and then substring completion
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
}

zsh_source_scripts
zsh_set_options

