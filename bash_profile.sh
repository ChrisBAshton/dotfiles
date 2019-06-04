#################
#### ALIASES ####
#################
source ~/.dotfiles/aliases/git.sh
source ~/.dotfiles/aliases/personal.sh
source ~/.dotfiles/aliases/utils.sh
source ~/.dotfiles/aliases/work.sh
source ~/.dotfiles/aliases/zsh.sh

#################
##### PATHS #####
#################
source ~/.dotfiles/paths/all.sh

#################
# MISCELLANEOUS #
#################
source ~/.dotfiles/scripts/atom.sh
source ~/.dotfiles/scripts/bbc.sh

if [ "$ZSH_THEME" = "random" ]; then
  echo "Setting theme to $RANDOM_THEME"
fi

echo "Profile loaded. Get coding!"

