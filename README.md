# ChrisBAshton Dotfiles

Setup:

- `cd ~ && git clone git@github.com:ChrisBAshton/dotfiles.git`
- Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- Delete the default `.zshrc`

Your `~/.zshrc` file should look like:

```bash
# Path to your oh-my-zsh installation.
export ZSH="/Users/christopherashton/.oh-my-zsh"

# any aliases you want to set up...
alias repl='irb' # ...because I always forget what the Ruby one is

# Pull in ChrisBAshton dotfiles
source ~/.dotfiles/bash_profile.sh
```

## Dependencies

- Assumes `nvm` and `avn` and `avn-nvm` is installed: https://github.com/wbyoung/avn
- You'll also want https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
- Powerline fonts https://gist.github.com/kevin-smets/8568070

## Usage

You can `reload` to reload your `.zshrc`. By default, this will also choose a random theme :)

If you want a specific theme, e.g. `agnoster`, you can `reload -t agnoster`.
