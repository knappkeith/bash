# Aliases
alias ll='ls -Al'
alias path='echo -e ${PATH//:/\\n}'

# Colors fro ls(ll)
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Virtual environments
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel

source /Library/Frameworks/Python.framework/Versions/Current/bin/virtualenvwrapper.sh
source /usr/share/git-core/git-prompt.sh
