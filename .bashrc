#!/bin/bash
#----------------------------------------------------------------------------------
# ALIASES
#----------------------------------------------------------------------------------
alias ll='ls -Al'
alias path='echo -e ${PATH//:/\\n}'
# alias tomstart='$CATALINA_HOME/bin/startup.sh'
# alias tomstop='$CATALINA_HOME/bin/shutdown.sh'
#----------------------------------------------------------------------------------
# End ALIASES
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
#----------------------------------------------------------------------------------
# Function to add to $PATH, 0 for $2 will add directory at beginning otherwise
#   it will be put on the end
function add_to_path {
    local mydir=$1
    local myindex=$2
    if [ -d "$mydir" ]; then
        if [[ $myindex =~ 0 ]]; then
            export PATH=$mydir:$PATH
        else
            export PATH=$PATH:$mydir
        fi
    else
        echo "WARNING: Directory, '$mydir', not Found, excluded from PATH!"
    fi
}

### GENERAL ###

# Add my bin to path
add_to_path $HOME/bin/ 1

# Colors fro ls(ll)
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

### PROGRAM SPECIFIC ###

# For Python, default to homebrew version
add_to_path /usr/local/opt/python/libexec/bin 0

# For Python Virtual Environments
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
source /usr/local/bin/virtualenvwrapper.sh

# For VSCode
add_to_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" 0

# For Sphnix Docs
# add_to_path /usr/local/opt/sphinx-doc/bin 0

# For Heroku
# Commenting out as not being used for now
# add_to_path /usr/local/heroku/bin 1

# For JAVA
# Commenting out as not being used for now
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home

# For MAVEN
# Commenting out as not being used for now
# add_to_path /usr/local/apache-maven/apache-maven-3.3.3/bin 1
# export MAVEN_OPTS="-Xms256m -Xmx512m"

# For TOMCAT
# Commenting out as not being used for now
# add_to_path /usr/local/apache-tomcat/apache-tomcat-7.0.62/bin 1
# export CATALINA_HOME=/usr/local/apache-tomcat/apache-tomcat-7.0.62

# For KAFKA
# Commenting out as not being used for now
# add_to_path /usr/local/ce-kafka/kafka_2.10.1-0.8.1/bin 1

# For NGROK
# Commenting out as not being used for now
# add_to_path /usr/local/ngrok 1

# For Docker
# Commenting out as not being used for now
# export DOCKER_HOST=tcp://192.168.59.103:2376
# export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1

#For UnRar
# Commenting out as not being used for now
# export UNRAR_LIB_PATH=/usr/lib/libunrar.so

# For Node
export NODE_ENV=dev

# For NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# For Ruby and OpenSSL
# Commenting out as not being used for now
# add_to_path /usr/local/opt/openssl@1.1/bin 1
# add_to_path /usr/local/opt/gettext/bin 1
# add_to_path /usr/local/Cellar/ruby/2.4.1_1/bin 1
#----------------------------------------------------------------------------------
# End ENVIRONMENT VARIABLES
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# Clean up
#----------------------------------------------------------------------------------
# unset functions
unset -f add_to_path
#----------------------------------------------------------------------------------
# End Clean up
#----------------------------------------------------------------------------------
