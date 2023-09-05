
# stuff to run
# git auto completion script - run if exists in home folder
test -f ~/.git-completion.bash && . $_

__git_complete gp _git_push
__git_complete gl _git_pull
__git_complete gsw _git_switch
