# Aliases
alias ll='ls -Al'
alias path='echo -e ${PATH//:/\\n}'

# Colors fro ls(ll)
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Virtual environments
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
export PATH

# Adding to Path
# For Sublime
PATH=~/bin:$PATH
export PATH

#Additional Sources
source ~/bash/.bash_prompt
source /usr/local/bin/virtualenvwrapper.sh

#For Docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/keith/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

#For UnRar
export UNRAR_LIB_PATH=/usr/lib/libunrar.so
