########################
### INCLUDE DEFAULTS ###
########################

source ~/.profile      # load RVM
source ~/.bash_include # load syntax highlighting, etc

########################
### WORK ALIASES #######
########################

alias sudodocker='docker-machine restart default && eval $(docker-machine env default)'

alias docker-init='bash "/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh"'
alias wraith--idt='docker run -P -v /Users/ashtoc03/Sites/bbc/news/responsive-news/idt/wraith:/wraithy -w='/wraithy' bbcnews/wraith'

# idt-product-tests
alias idt-wraith='docker run -P -v /Users/ashtoc03/Sites/bbc/idt-product-tests/wraith:/wraithy -w="/wraithy" idt-wraith'
alias idt-cucumber='docker run -P -v /Users/ashtoc03/Sites/bbc/idt-product-tests:/idt-product-tests -w="/idt-product-tests" idt-cucumber'


alias bbc='~/Sites/bbc/news/special/utils/main.sh'
alias iframetest_setup='cd ~/Sites/bbc/news/special/iframe-scaffold/root/newsspec_'
alias iframetest_node='iframetest_setup && node_modules/.bin/vows tests/node/tests/*.js --verbose'
alias iframetest_cucumber='iframetest_setup && node_modules/casperjs/bin/casperjs test --fail-fast tests/cucumber.js'
alias iframetest='iframetest_node && iframetest_cucumber'

alias quickftp="perl ~/Sites/bbc/news/specials/projects/perl-specials-osx-manual-ftp/ftp.pl"


alias unsafe-chrome='open -a Google\ Chrome --args --disable-web-security'

alias lsa="ls -la"

alias gd="git diff"
alias gl="git log"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gpu="git rev-parse --abbrev-ref HEAD | xargs git push -u origin" # push new branch to origin

###### OTHER CONFIG FILES

source ~/Sites/bbc/news/special/utils/legacy/bash_profile
source ~/Sites/bbc/other/hackfix/lib/hackfix_profile

PATH=$PATH:./node_modules/.bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
