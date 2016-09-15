# Sets the title of the current tab
function title {
    echo -ne "\033]0;"$*"\007"
}

# Updates a virtual environments symlinks when there is
# an update to an installed item, ie Python
function fix_virtualenv_symlink {
  for d in ~/.virtualenvs/*/ ; do
    echo "$d"
    find "$d" -type l -delete
    virtualenv "$d"
  done
}

# Updates all python Packages in a virtual env
function pip_update_all {
  echo 'Updating PIP'
  pip install --upgrade pip
  toupdate=$(pip list --local --outdated | grep -v '^\-e')
  echo 'Do you wish to update the following:'
  echo "$toupdate"
  select yn in "Yes" "No"; do
    case $yn in
      Yes ) pip list --local --outdated | grep -v '^\-e' | cut -d ' ' -f 1 | xargs -n1 pip install -U; break;;
      No ) break;;
    esac
  done
  
}

# Goes to the Viawest Directory, starts up the virtual
# env and sets the title
function goto_viawest {
  cd /Users/keith/dev/cloud-elements/ri-test/
  workon pytest_viawest
  title VIAWEST
}

# clears Viawest Dev cache
function vw_dev_cache {
  redis-cli -h 10.33.233.110 flushall
  redis-cli -h 10.33.233.111 flushall
}

# clears Viawest staging cache
function vw_stg_cache {
  redis-cli -h 10.33.233.51 flushall
  redis-cli -h 10.33.233.52 flushall
}


# Funcitions for SOBA and Integration Manager
function workon_soba {
  export CATALINA_BASE='/usr/local/apache-tomcat/apache-tomcat-7.0.62.soba'
  export CATALINA_OPTS="-Dsoba.system.dir=elements_config -Dsoba.filename=elements.properties -Dfile.encoding=UTF-8 -agentlib:jdwp=transport=dt_socket,address=5005,server=y,suspend=n"
  export APP_URL='http://localhost:8080/elements/jsp/login.jsp'
  export PROMPT_VAR="Soba"
}

function tom_start_soba {
  export CATALINA_BASE='/usr/local/apache-tomcat/apache-tomcat-7.0.62.soba'
  export CATALINA_OPTS="-Dsoba.system.dir=elements_config -Dsoba.filename=elements.properties -Dfile.encoding=UTF-8 -agentlib:jdwp=transport=dt_socket,address=5005,server=y,suspend=n"
  export APP_URL='http://localhost:8080/elements/jsp/login.jsp'
  export PROMPT_VAR="Soba"
  tomstart
}

function workon_im {
  export CATALINA_BASE='/usr/local/apache-tomcat/apache-tomcat-7.0.62.im'
  export CATALINA_OPTS="-Dsoba.system.dir=inspirato-im-config -Dsoba.filename=integrationmanager.properties -Dfile.encoding=UTF-8"
  export APP_URL='http://localhost:8081/integrationmanager/jsp/login.jsp'
  export PROMPT_VAR="Inspirato"
}

function tom_start_im {
  export CATALINA_BASE='/usr/local/apache-tomcat/apache-tomcat-7.0.62.im'
  export CATALINA_OPTS="-Dsoba.system.dir=inspirato-im-config -Dsoba.filename=integrationmanager.properties -Dfile.encoding=UTF-8"
  export APP_URL='http://localhost:8081/integrationmanager/jsp/login.jsp'
  export PROMPT_VAR="Inspirato"
  tomstart
}

function deactivate_soba {
  export CATALINA_BASE=""
  export CATALINA_OPTS=""
  export APP_URL=""
  export PROMPT_VAR=""
}

function deactivate_im {
  export CATALINA_BASE=""
  export CATALINA_OPTS=""
  export APP_URL=""
  export PROMPT_VAR=""
}

function tom_stop_soba {
  export CATALINA_BASE='/usr/local/apache-tomcat/apache-tomcat-7.0.62.soba'
  export CATALINA_OPTS="-Dsoba.system.dir=elements_config -Dsoba.filename=elements.properties -Dfile.encoding=UTF-8 -agentlib:jdwp=transport=dt_socket,address=5005,server=y,suspend=n"
  export APP_URL='http://localhost:8080/elements/jsp/login.jsp'
  tomstop
}

function tom_stop_im {
  export CATALINA_BASE='/usr/local/apache-tomcat/apache-tomcat-7.0.62.im'
  export CATALINA_OPTS="-Dsoba.system.dir=inspirato-im-config -Dsoba.filename=integrationmanager.properties -Dfile.encoding=UTF-8"
  export APP_URL='http://localhost:8081/integrationmanager/jsp/login.jsp'
  tomstop
}

function url_open {
  open $APP_URL
}

function kill_chromedriver {
  ps aux | grep chromedriver | grep utils | tr -s ' ' | cut -d ' ' -f 2 | while read x; do kill -9 $x; done
}

function kill_phantomjs {
  ps aux | grep phantomjs | grep utils | tr -s ' ' | cut -d ' ' -f 2 | while read x; do kill -9 $x; done
}

function run_speed_tester {
  cd ~/dev/personal/my_tools/
  workon myTools
  title "Network Speed"
  ./speed_tester.py
}