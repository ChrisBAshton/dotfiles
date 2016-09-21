#exy Bash Prompt, inspired by "Extravagant Zsh Prompt"
# Screenshot: http://i.imgur.com/6CXVE.png
# A big thanks to \amethyst on Freenode

if [[ $COLORTERM = gnome-* && $TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then TERM=gnome-256color; fi
if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
  MAGENTA=$(tput setaf 9)
  ORANGE=$(tput setaf 172)
  PINK=$(tput setaf 127)
  PURPLE=$(tput setaf 141)
  WHITE=$(tput setaf 256)
else
  MAGENTA=$(tput setaf 5)
  ORANGE=$(tput setaf 4)
  PINK=$(tput setaf 4)
  PURPLE=$(tput setaf 1)
  WHITE=$(tput setaf 7)
fi
BOLD=$(tput bold)
RESET=$(tput sgr0)

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]at \[$ORANGE\]\h \[$WHITE\]in \[$PINK\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"
