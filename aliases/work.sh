alias k="kubectl"
alias run="govuk-docker-run bundle exec"
alias gbundle="govuk-docker-run bundle"

awsconsole() {
    # Usage: `awsconsole integration poweruser`
    # Arg 1: integration, staging, production
    # Arg 2: readonly, poweruser, administrator
    # Defaults to poweruser role.
    echo "Opening AWS console on $1 (${2:-poweruser})..."
    gds aws govuk-$1-${2:-poweruser} -l
}

# govuk kubernetes
kcontext() {
    # Usage: `kcontext integration poweruser`
    # Arg 1: integration, staging, production
    # Arg 2: readonly, poweruser, administrator
    # Defaults to poweruser role.
    echo "Switching GOV.UK kubernetes context to $1 (${2:-poweruser})..."
    k config use-context $1 && eval $(gds aws govuk-$1-${2:-poweruser} -e --art 8h)
}

kconsole() {
    # Usage `kconsole manuals-publisher`
    # Arg 1: app to connect to
    echo "Opening a rails console on $1 on $(eval k config current-context)..."
    k exec -it deploy/$1 -- rails c
}

krake() {
    # Usage `krake asset-manager assets:redirect[content_id,url]`
    # Arg 1: app to connect to
    # Arg 2: rake task to run
    echo "Running rake task on $1 on $(eval k config current-context): $2"
    k exec -it deploy/$1 -- rake $2
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
