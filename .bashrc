git config --global mergetool.fugitive.cmd 'nvim -f -c "Gvdiffsplit!" "$MERGED"'
git config --global merge.tool fugitive

# Gen alias
alias s="source"
alias c="clear"
alias hg="history | grep"
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

# Vim alias
alias v='nvim'
alias vf='nvim $(fzf)' 

# Tmux alias
alias ta='tmux attach'

# Nav alias
alias cd="cd -P"
alias cf='cd $(find . -type d -print | fzf)'

#Git alias
source /usr/share/bash-completion/completions/git

alias g="git"
__git_complete g _git_main
alias ga="git add"
__git_complete ga _git_add
alias gb="git branch"
__git_complete gb _git_branch
alias gc="git commit"
__git_complete gc _git_commit
alias gch="git checkout"
__git_complete gch _git_checkout
alias gd="git diff"
__git_complete gd _git_diff
alias gl="git log"
__git_complete gl _git_log
alias gp="git pull"
__git_complete gp _git_pull
alias gr="git rebase"
__git_complete gr _git_rebase
alias gst="git stash"
__git_complete gst _git_stash
alias gs="git status"
__git_complete gs _git_status

