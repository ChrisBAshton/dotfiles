alias gd="git diff"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gpl="git pull"
alias gb="git branch"
alias gco="git checkout"
alias grbm="git rebase -i master"
alias grbc="git rebase --continue"
alias grbi="git rebase --ignore-date master"
alias gpu='git push -u origin "$(git name-rev --name-only HEAD)"' # push new branch to origin
alias gpuf='git push --force-with-lease origin "$(git name-rev --name-only HEAD)"' # safely force-push the current branch
alias addtocommit="git commit . --amend --no-edit"
# resets the timestamp of the current commit. Great if you've reordered a commit in a rebase, but don't want to 'git rebase --ignore-date master' on ALL commits
alias resetcommit="LC_ALL=C GIT_COMMITTER_DATE=\"$(date)\" git commit --amend --no-edit --date \"$(date)\""
alias gitreset="git reset --hard HEAD"
alias delete_merged_branches='git branch --merged | egrep -v "(^\*|master|dev|main)" | xargs git branch -d' # https://stackoverflow.com/a/6127884/5841356
