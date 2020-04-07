# Path to your oh-my-zsh installation.
export ZSH="/Users/christopherashton/.oh-my-zsh"

# govuk-guix
export PATH="$PATH:/Users/christopherashton/govuk/govuk-guix/bin"

# govuk-docker
# export PATH=$PATH:~/govuk/govuk-docker/bin
export PATH=$PATH:~/govuk/govuk-docker/exe

# ...and depended on by govuk-docker
export PATH=$PATH:/usr/local/sbin

# gpg/gpg2
export PATH="$PATH:/usr/local/MacGPG2/bin/"

if [ -z "$GOVUK_SSH_SETUP" ]; then
  # add alphagov ssh keys to your profile so that you can `govukcli ssh jumpbox`
  /usr/bin/ssh-add -K ~/.ssh/alphagov
  export GOVUK_SSH_SETUP=true
fi

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add AWS CLI (installed to ~/bin)
export PATH="$PATH:~/bin"

# force load rbenv to ensure correct version of ruby used
export PATH="$PATH:~/.rbenv/shims"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Pull in ChrisBAshton dotfiles
source ~/.dotfiles/bash_profile.sh

# allow gds-cli, which uses 'gds' as its entrypoint
# we want to unalias the ZSH implementation of 'gds' (which does something git-y)
unalias gds
