source ~/.dotfiles/globals.sh

#################
#### ALIASES ####
#################
source ~/.dotfiles/aliases/git.sh
FILE=~/.dotfiles/aliases/personal.sh && test -f $FILE && source $FILE
source ~/.dotfiles/aliases/utils.sh
source ~/.dotfiles/aliases/work.sh

#################
### OH-MY-ZSH ###
#################
source ~/.dotfiles/zsh-config.sh
source $ZSH/oh-my-zsh.sh

setopt NO_NOMATCH

echo "Profile loaded. Get coding!"
