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

# Claude
# sbxc: start (creating if needed) a Claude sandbox for the current directory,
# syncing your global ~/.claude/settings.json and ~/.claude/CLAUDE.md into it.
#
# Usage:
#   cd ~/govuk && sbxc
#   SBX_NAME=my-sandbox sbxc                 # custom sandbox name
#   sbxc --model claude-opus-5-5             # any extra args are passed to claude
sbxc() {
  local agent="claude"
  local name="${SBX_NAME:-${agent}-$(basename "$PWD")}"
  local settings_src="$HOME/.claude/settings.json"
  local claude_md_src="$HOME/.claude/CLAUDE.md"

  if ! sbx ls -q 2>/dev/null | grep -qx "$name"; then
    echo "sbxc: creating sandbox '$name'..."
    sbx create --name "$name" "$agent" . || return 1
  fi

  if [[ -f "$settings_src" ]]; then
    local seeded merged
    seeded=$(mktemp)
    merged=$(mktemp)
    sbx exec "$name" -- cat /home/agent/.claude/settings.json > "$seeded" 2>/dev/null
    [[ -s "$seeded" ]] || echo '{}' > "$seeded"
    jq -s '.[0] * .[1]' "$seeded" "$settings_src" > "$merged"
    sbx cp "$merged" "$name:/home/agent/.claude/settings.json"
    sbx exec -u root "$name" -- chown agent:agent /home/agent/.claude/settings.json
    rm -f "$seeded" "$merged"
    echo "sbxc: merged global settings into sandbox '$name'"
  else
    echo "sbxc: no $settings_src found, skipping settings merge" >&2
  fi

  if [[ -f "$claude_md_src" ]]; then
    sbx cp "$claude_md_src" "$name:/home/agent/.claude/CLAUDE.md"
    sbx exec -u root "$name" -- chown agent:agent /home/agent/.claude/CLAUDE.md
    echo "sbxc: synced global CLAUDE.md into sandbox '$name'"
  else
    echo "sbxc: no $claude_md_src found, skipping CLAUDE.md sync" >&2
  fi

  sbx run --name "$name" "$agent" \
    -e AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY \
    -e AWS_SESSION_TOKEN \
    -e AWS_REGION \
    -e AWS_DEFAULT_REGION \
    -- "$@"
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
