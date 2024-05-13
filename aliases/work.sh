alias k="kubectl"
alias run="govuk-docker-run bundle exec"
alias gbundle="govuk-docker-run bundle"
# govuk kubernetes
context() {
    # Usage: `context integration poweruser`
    # Arg 1: integration, staging, production
    # Arg 2: readonly, poweruser, administrator
    echo "Switching GOV.UK kubernetes context to $1 (${2:-poweruser})..."
    k config use-context $1 && eval $(gds aws govuk-$1-${2:-poweruser} -e --art 8h)
}

# govuk-docker
export PATH=$PATH:~/govuk/govuk-docker/exe

# ...and depended on by govuk-docker
export PATH=$PATH:/usr/local/sbin

# gpg/gpg2
export PATH="$PATH:/usr/local/MacGPG2/bin/"

# Install ASDF using Git, NOT brew - too many issues with the latter. See:
# https://asdf-vm.com/guide/getting-started.html#_1-install-dependencies
# Then follow the "ZSH & Git" instructions at:
# https://asdf-vm.com/guide/getting-started.html#_3-install-asdf
. $HOME/.asdf/asdf.sh
