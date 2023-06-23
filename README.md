# ChrisBAshton Dotfiles

## Setup

```sh
git clone git@github.com:ChrisBAshton/dotfiles.git ~/.dotfiles
git clone git@github.com:ohmyzsh/ohmyzsh.git ~/.dotfiles/.oh-my-zsh
git clone git@github.com:zsh-users/zsh-autosuggestions.git ~/.dotfiles/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo "source ~/.dotfiles/zshrc.sh" > "$HOME/.zshrc"
```

Then just do a quick `ls -lsa ~` to make sure you don't have a `~/.bash_profile` (or if you do, copy the settings over to `~/.dotfiles/`).

Also look in `work.sh` for any work-specific installation instructions (e.g. ASDF).

### ASDF

If a new version of Ruby comes out, ASDF may not know about it out of the box:

```
$  asdf install ruby 3.2.2
Version not found
```

The solution is to get it to update its indexes:

```
asdf plugin update ruby
```
