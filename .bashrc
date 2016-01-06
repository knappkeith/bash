### ALIASES ###
alias ll='ls -Al'
alias path='echo -e ${PATH//:/\\n}'
alias tomstart='$CATALINA_HOME/bin/startup.sh'
alias tomstop='$CATALINA_HOME/bin/shutdown.sh'

# Colors fro ls(ll)
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

### PROGRAM SPECIFIC ###

# For Python Virtual Environments
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
export PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/lib:$PATH
source /usr/local/bin/virtualenvwrapper.sh

# For Python TEMP
export PYTHONPATH=~/dev/cloud-elements/HybridPortal/src/main/test/integration

# For Heroku
export PATH="/usr/local/heroku/bin:$PATH"

# For SUBLIME
export PATH=~/bin:$PATH

# For JAVA
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home

# For MAVEN
export PATH=$PATH:/usr/local/apache-maven/apache-maven-3.3.3/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"

# For TOMCAT
export PATH=$PATH:/usr/local/apache-tomcat/apache-tomcat-7.0.62/bin
export CATALINA_HOME=/usr/local/apache-tomcat/apache-tomcat-7.0.62

# For KAFKA
export PATH=$PATH:/usr/local/ce-kafka/kafka_2.10.1-0.8.1/bin

# For NGROK
export PATH=$PATH:/usr/local/ngrok

# For Docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/keith/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

#For UnRar
export UNRAR_LIB_PATH=/usr/lib/libunrar.so

# For RVM
export PATH="$PATH:$HOME/.rvm/bin"

# For Cloud Elements
export CE_DEV=~/dev/cloud-elements
export SOBA=~/dev/cloud-elements/soba
export PATH=$PATH:$CE_DEV
export PATH=$PATH:~/dev/cloud-elements/inspirato
# export CATALINA_OPTS="-Dsoba.system.dir=inspirato-im-config -Dsoba.filename=integrationmanager.properties -Dfile.encoding=UTF-8"
# export CATALINA_OPTS="-Dsoba.system.dir=elements_config -Dsoba.filename=elements.properties -Dfile.encoding=UTF-8 -agentlib:jdwp=transport=dt_socket,address=5005,server=y,suspend=n"
