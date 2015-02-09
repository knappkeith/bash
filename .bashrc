# Aliases
alias ll='ls -Al'
alias path='echo -e ${PATH//:/\\n}'

# Colors fro ls(ll)
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Virtual environments
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel

#Additional Sources
source ~/bash/.bash_prompt
source /usr/local/bin/virtualenvwrapper.sh
