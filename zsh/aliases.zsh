#!/usr/bin/zsh

# git shortcuts
alias gs="git status"
alias ga="git add -A ."
alias gc="git commit"
alias gb="git branch"
alias gd="git diff"
alias gco="git checkout"
alias gp="git push"
alias gl="git pull --ff-only"
alias gt="git tag"
alias gm="git merge"
alias gg="git log --graph --pretty=format:'%C(bold red)%h%Creset -%C(bold yellow)%d%Creset %s %C(bold green)(%cr) %C(bold blue)<%an>%Creset %C(yellow)%ad%Creset' --abbrev-commit --date=short"
alias ggr="git log --reverse --pretty=format:'%C(bold red)%h%Creset -%C(bold yellow)%d%Creset %s %C(bold green)(%cr) %C(bold blue)<%an>%Creset %C(yellow)%ad%Creset' --abbrev-commit --date=short"
alias gcp="git cherry-pick"
alias gbg="git bisect good"
alias gbb="git bisect bad"
alias gsn="git fetch upstream `git rev-parse --abbrev-ref HEAD` && git merge upstream/`git rev-parse --abbrev-ref HEAD` && git push"

# other shortcuts
alias ytt='yutto -d ~/Movies/yutto/ -c `cat ~/.sessdata` -n 16 --vcodec="av1:copy" --alias-file=`echo ~/.yutto_alias`'
