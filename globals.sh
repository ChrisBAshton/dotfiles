export ZSH="$HOME/.dotfiles/.oh-my-zsh"

# to install Git via Homebrew
export PATH=/usr/local/bin:$PATH

# php
export PATH=/usr/local/php5/bin:$PATH;

# NVM/NPM/Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# these were in my ~/.bashrc, guess they need to be exposed too!
export NODE_PATH="/usr/local/share/npm/lib/node_modules"

# Fix SSH username on GOV.UK
export USER="christopherashton"

