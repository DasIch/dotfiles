# load config files
for config_file ($ZSH/config/*.zsh) source $config_file

# load/run compinit
autoload -U compinit
compinit -i

# load theme
if [ ! "$ZSH_THEME" = "" ]
then
  source "$ZSH/themes/$ZSH_THEME.zsh-theme"
fi
