export ZSH="$HOME/.dotfiles/.oh-my-zsh"

# force load rbenv to ensure correct version of ruby used
export PATH="$PATH:~/.rbenv/shims"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# to install Git via Homebrew
export PATH=/usr/local/bin:$PATH

# php
export PATH=/usr/local/php5/bin:$PATH;

# rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# NVM/NPM/Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# these were in my ~/.bashrc, guess they need to be exposed too!
export NODE_PATH="/usr/local/share/npm/lib/node_modules"
