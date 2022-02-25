export ZSH="$HOME/.dotfiles/.oh-my-zsh"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# force load rbenv to ensure correct version of ruby used
export PATH="$PATH:~/.rbenv/shims"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

echo "Profile loaded. Get coding!"
