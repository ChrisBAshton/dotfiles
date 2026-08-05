alias k="kubectl"
alias run="govuk-docker-run bundle exec"
alias gbundle="govuk-docker-run bundle"

smartcop() {
  local -a files
  files=("${(@f)$(git diff main --cached --name-only --diff-filter=ACM | grep -E '\.(rb|rake)$')}")

  (( ${#files[@]} )) || { echo "No Ruby changes."; return 0; }

  govuk-docker-run rubocop -A --force-exclusion -- "${files[@]}"
}

awsconsole() {
    # Usage: `awsconsole integration developer`
    # Arg 1: integration, staging, production
    # Arg 2: developer, readonly, poweruser, administrator
    # Defaults to developer role.
    echo "Opening AWS console on $1 (${2:-developer})..."
    gds aws govuk-$1-${2:-developer} -l
}

# govuk kubernetes
kcontext() {
    # Usage: `kcontext`
    # Gets the current context.
    #
    # Usage: `kcontext integration developer`
    # Arg 1: integration, staging, production
    # Arg 2: developer, readonly, poweruser, administrator
    # Defaults to developer role.
    if [ $# -eq 0 ]
    then
        k config current-context
    else
        echo "Switching GOV.UK kubernetes context to $1 (${2:-developer})..."
        k config use-context $1 && eval $(gds aws govuk-$1-${2:-developer} -e --art 8h)
    fi
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

# Install ASDF using brew
# https://asdf-vm.com/guide/getting-started.html#_1-install-dependencies
# Then follow the "ZSH" instructions at:
# https://asdf-vm.com/guide/getting-started.html#_3-install-asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
