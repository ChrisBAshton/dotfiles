# ChrisBAshton Dotfiles

Setup:

```sh
cd ~
git clone git@github.com:ChrisBAshton/dotfiles.git
echo "source ~/.dotfiles/zshrc.sh" > "$HOME/.zshrc"
```

## Dependencies

- Assumes `nvm` and `avn` and `avn-nvm` is installed: https://github.com/wbyoung/avn

## Usage

You can `reload` to reload your `.zshrc`. By default, this will also choose a random theme :)

If you want a specific theme, e.g. `agnoster`, you can `reload -t agnoster`.
