# allow prompt substitutions
setopt prompt_subst

# load vcs_info
autoload -Uz vcs_info

zstyle ':vcs_info:*' use-prompt-escapes true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "!"
zstyle ':vcs_info:*' unstagedstr "?"
zstyle ':vcs_info:*' formats " on %{$fg[grey]%}%s%{$reset_color%}:%b%%{$fg[red]%}%u%c%{$reset_color%}"
zstyle ':vcs_info:*' actionformats " on %{$fg[grey]%}%s%{$reset_color%}:%b%%{$fg[red]%}%u%c %a%{$reset_color%}"


# update vcs_info
function precmd() {
  vcs_info
  PS1="\
%{$fg[magenta]%}%n%{$reset_color%} \
at %{$fg[cyan]%}%m%{$reset_color%} \
in %{$fg_bold[green]%c%}%{$reset_color%}\
${vcs_info_msg_0_}
%# "
}
