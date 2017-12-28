export PATH=$PATH:./node_modules/.bin
export PATH=$PATH:./bin/

# to install Git via Homebrew
export PATH=/usr/local/bin:$PATH

export PATH=$PATH:/usr/local/bin:/usr/local/bin:$HOME/.rvm/gems/ruby-2.1.3/bin:$HOME/.rvm/gems/ruby-2.1.3@global/bin:$HOME/.rvm/rubies/ruby-2.1.3/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/texbin:$HOME/.rvm/bin:$HOME/.rvm/bin:$HOME/Documents/bbc/chromedriver:$HOME/bin

export PATH=$HOME/.rvm/gems/ruby-2.0.0-p353/bin:$PATH
export PATH=/usr/local/php5/bin:$PATH;

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


export PATH=/usr/local/bin:$PATH


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=$PATH:$HOME/Library/Python/2.7/bin

# these were in my ~/.bashrc, guess they need to be exposed too!
export PYTHONPATH="/Library/Python/2.7/site-packages"
export NODE_PATH="/usr/local/share/npm/lib/node_modules"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
