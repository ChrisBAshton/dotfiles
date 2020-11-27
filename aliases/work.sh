alias run="govuk-docker-run bundle exec"
alias gbundle="govuk-docker-run bundle"

# govuk-guix
export PATH="$PATH:~/govuk/govuk-guix/bin"

# govuk-docker
export PATH=$PATH:~/govuk/govuk-docker/exe

# ...and depended on by govuk-docker
export PATH=$PATH:/usr/local/sbin

# gpg/gpg2
export PATH="$PATH:/usr/local/MacGPG2/bin/"

# Add AWS CLI (installed to ~/bin)
export PATH="$PATH:~/bin"

# GOVUK SSH
if [ -z "$GOVUK_SSH_SETUP" ]; then
  if [ -f ~/.ssh/alphagov ]; then
    # add alphagov ssh keys to your profile so that you can SSH
    /usr/bin/ssh-add -K ~/.ssh/alphagov
    export GOVUK_SSH_SETUP=true
  fi
  # else assume we're on personal Mac
fi
