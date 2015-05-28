
function title {
    echo -ne "\033]0;"$*"\007"
}

function func2 {
  DEFAULT=default 
   if [ -z "$1" ]                           # Is parameter #1 zero length?
   then
     echo "-Parameter #1 is zero length.-"  # Or no parameter passed.
   else
     echo "-Parameter #1 is \"$1\".-"
   fi

   variable=${2-$DEFAULT}                   #  What does
   echo "variable = $variable"              #+ parameter substitution show?
                                            #  ---------------------------
                                            #  It distinguishes between
                                            #+ no param and a null param.

   if [ "$2" ]
   then
     echo "-Parameter #2 is \"$2\".-"
   fi

}
function file_exists {
  file_1="$HOME/elements_config/elements.properties.$1"
  # echo $file_1
  if [ -e "$file_1" ]
  then
    echo 1
  else
    echo 0
  fi
}
function test_exists {
  result=$(file_exists $1)
  echo $1
  echo $result
  if [ $result == 1 ]
  then
    echo 'is good'
  else
    echo 'is bad'
  fi
}

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