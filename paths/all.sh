# to install Git via Homebrew
export PATH=/usr/local/bin:$PATH

# php
export PATH=/usr/local/php5/bin:$PATH;

# rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# python
export PATH=$PATH:$HOME/Library/Python/2.7/bin

# these were in my ~/.bashrc, guess they need to be exposed too!
export PYTHONPATH="/Library/Python/2.7/site-packages"
export NODE_PATH="/usr/local/share/npm/lib/node_modules"
