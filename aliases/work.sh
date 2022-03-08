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

# ASDF
# See https://mac.install.guide/ruby/5.html#:~:text=We%20must%20add%20asdf%20to%20the%20shell%20environment
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# 'pass' (for govuk-secrets)
source /usr/local/etc/bash_completion.d/password-store
