reload() {
  # override the theme if we want, e.g. `reload -t 'agnoster'`
  ZSH_THEME=""
  while getopts ":t:" opt; do
    case $opt in
      t)
        echo "Setting theme to '$OPTARG'"
        ZSH_THEME="$OPTARG"
        ;;
    esac
  done

  if [ -z "$ZSH_THEME" ]; then
    echo "Choosing theme at random..."
    ZSH_THEME=random
  fi
  source ~/.zshrc
}

#if [ -z "$ZSH_THEME" ]; then
#  echo "Welcome to your terminal. Choosing a theme at random..."
#  echo "(Try a different one by running 'reload', or specify by running e.g. 'reload -t fino'."
#  echo "These are all great themes: 'fino', 'agnoster', 'af-magic', 'steeef'"
#  ZSH_THEME=random
#fi

ZSH_THEME=fino

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitfast zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

setopt NO_NOMATCH

# This must come AFTER the `oh-my-zsh.sh` sourcing
if [ "$ZSH_THEME" = "random" ]; then
  echo "Setting theme to $RANDOM_THEME"
fi
