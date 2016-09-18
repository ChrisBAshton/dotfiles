#################
#### ALIASES ####
#################
source ~/.dotfiles/aliases/git.sh
source ~/.dotfiles/aliases/personal.sh
source ~/.dotfiles/aliases/program.sh
source ~/.dotfiles/aliases/utils.sh
source ~/.dotfiles/aliases/work.sh

#################
#### THEMES #####
#################
source ~/.dotfiles/theme/exy.sh

#################
##### PATHS #####
#################

source ~/.dotfiles/paths/all.sh

#################
# MISCELLANEOUS #
#################

# Load BBC Utils only if it exists
BBC_UTILS=~/Sites/bbc/news/special/utils/legacy/bash_profile && test -f $BBC_UTILS && source $BBC_UTILS
