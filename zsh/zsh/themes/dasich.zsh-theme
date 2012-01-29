# allow prompt substitutions
setopt prompt_subst

# load vcs_info
autoload -Uz vcs_info

zstyle ':vcs_info:*' use-prompt-escapes true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "!"
zstyle ':vcs_info:*' unstagedstr "?"
zstyle ':vcs_info:*' formats "on %s:%b%u%c"
zstyle ':vcs_info:*' actionformats "on %s:%b%u%c %a"


# update vcs_info
function precmd() {
  vcs_info
  BASEPROMPT="${fg[white]}%n at %m in %c ${vcs_info_msg_0_}"
  if [ "$VIRTUAL_ENV" != "" ]
  then
    BASEPROMPT="$BASEPROMPT working on $(basename $VIRTUAL_ENV)"
  fi
  PS1="$BASEPROMPT
%# $terminfo[sgr0]"
}
