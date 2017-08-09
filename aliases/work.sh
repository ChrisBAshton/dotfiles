alias sudodocker='docker-machine restart default && eval $(docker-machine env default)'

alias docker-init='bash "/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh"'
alias wraith--idt='docker run -P -v $HOME/Sites/bbc/news/responsive-news/idt/wraith:/wraithy -w='/wraithy' bbcnews/wraith'

# idt-product-tests
alias idt-wraith='docker run -P -v $HOME/Sites/bbc/idt-product-tests/wraith:/wraithy -w="/wraithy" idt-wraith'
alias idt-cucumber='docker run -P -v $HOME/Sites/bbc/idt-product-tests:/idt-product-tests -w="/idt-product-tests" idt-cucumber'

alias bbc='~/Sites/bbc/news/special/utils/main.sh'
alias iframetest_setup='cd ~/Sites/bbc/news/special/iframe-scaffold/root/newsspec_'
alias iframetest_node='iframetest_setup && node_modules/.bin/vows tests/node/tests/*.js --verbose'
alias iframetest_cucumber='iframetest_setup && node_modules/casperjs/bin/casperjs test --fail-fast tests/cucumber.js'
alias iframetest='iframetest_node && iframetest_cucumber'

alias quickftp="perl ~/Sites/bbc/news/specials/projects/perl-specials-osx-manual-ftp/ftp.pl"

alias use-phantomjs='   brew unlink phantomjs198; brew link phantomjs;    phantomjs -v'
alias use-phantomjs198='brew unlink phantomjs;    brew link phantomjs198; phantomjs -v'

function rubo() {
  docker run \
    --cpu-shares 1024 \
    --rm=true \
    --volume $(pwd):/app \
    bbcnews/rubocop-config --format simple --fail-level F | grep '^F:\|=='
}

alias p12topem='openssl pkcs12 -in certificate.p12 -out certificate.pem -clcerts -nodes'
alias pemtop12='openssl pkcs12 -export -in certificate.pem -out certificate.p12 -passout pass:password'
