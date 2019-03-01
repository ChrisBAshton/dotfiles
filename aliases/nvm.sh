# This loads NVM in your PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# By default, NVM doesn't respect the .nvmrc file in projects.
# You'd have to manually invoke with `nvm use`.
# Which is why we're using deeper shell integration as outlined here:
# https://github.com/creationix/nvm#deeper-shell-integration

find-up () {
    path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$1" ]]; do
        path=${path%/*}
    done
    echo "$path"
}

cdnvm(){
    cd "$@";
    nvm_path=$(find-up .nvmrc | tr -d '[:space:]')

    # If there are no .nvmrc file, use the default nvm version
    if [[ ! $nvm_path = *[^[:space:]]* ]]; then

        declare default_version;
        default_version=$(nvm version default);

        # If there is no default version, set it to `node`
        # This will use the latest version on your machine
        if [[ $default_version == "N/A" ]]; then
            nvm alias default node;
            default_version=$(nvm version default);
        fi

        # If the current version is not the default version, set it to use the default version
        if [[ $(nvm current) != "$default_version" ]]; then
            nvm use default;
        fi

        elif [[ -s $nvm_path/.nvmrc && -r $nvm_path/.nvmrc ]]; then
        declare nvm_version
        nvm_version=$(<"$nvm_path"/.nvmrc)

        # Add the `v` suffix if it does not exists in the .nvmrc file
        if [[ $nvm_version != v* ]]; then
            nvm_version="v""$nvm_version"
        fi

        # If it is not already installed, install it
        if [[ $(nvm ls "$nvm_version" | tr -d '[:space:]') == "N/A" ]]; then
            nvm install "$nvm_version";
        fi

        if [[ $(nvm current) != "$nvm_version" ]]; then
            nvm use "$nvm_version";
        fi
    fi
}
alias cd='cdnvm'
cd . # force refresh to respect .nvmrc version (so that opening new terminal tabs works)
