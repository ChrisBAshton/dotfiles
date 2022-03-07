alias run="govuk-docker-run bundle exec"
alias gbundle="govuk-docker-run bundle"
alias gdssh="gds govuk connect ssh -e" # e.g. `gdssh integration jumpbox`
alias console="gds govuk connect app-console -e" # e.g. `console staging publishing_api/publishing-api`
alias dbconsole="gds govuk connect app-dbconsole -e" # e.g. `dbconsole staging publishing_api/publishing-api`

# govuk-docker
export PATH=$PATH:~/govuk/govuk-docker/exe

# ...and depended on by govuk-docker
export PATH=$PATH:/usr/local/sbin

# gpg/gpg2
export PATH="$PATH:/usr/local/MacGPG2/bin/"

# GOVUK SSH
if [ -z "$GOVUK_SSH_SETUP" ]; then
  if [ -f ~/.ssh/alphagov ]; then
    # add alphagov ssh keys to your profile so that you can SSH
    /usr/bin/ssh-add -K ~/.ssh/alphagov
    export GOVUK_SSH_SETUP=true
  fi
  # else assume we're on personal Mac
fi

# Verify
export JAVA_HOME='/Library/Java/JavaVirtualMachines/adoptopenjdk-15.jdk/Contents/Home/'
