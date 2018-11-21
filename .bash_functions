#----------------------------------------------------------------------------------
# Python Specific Funtions
#----------------------------------------------------------------------------------
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
#----------------------------------------------------------------------------------
# End Python Functions
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# GOTO functions: Navigates to correct Directory, sets up needed environment,
#   sets title, and any other needed setup
#----------------------------------------------------------------------------------
# TOOLS
function goto_tools {
  cd /Users/keith/dev/cloud-elements/tools-ce/
  workon tools
  title ceTOOLS
}

# FORMUALS
function goto_formulas {
  cd /Users/keith/dev/cloud-elements/formulas/
  workon tools
  title FORMULAS
}

# USE CASE TEST
function goto_use_case {
  cd /Users/keith/dev/cloud-elements/use_case_testing/
  workon tools
  title USE_CASE
  subl -b .
}

# pyCHURROS
function goto_pychurros {
  cd /Users/keith/dev/cloud-elements/pyChurros/
  workon pyChurros
  title pyCHURROS
  subl -b .
  subl -a ../churros-sauce/
}

function goto_qaauto {
  cd /Users/keith/dev/cloud-elements/qaAutomation/
  workon test37
  title "Churros+"
  subl -b .
  subl -a ../churros-sauce/
}

function goto_mstr {
  cd /Users/keith/dev/cloud-elements/qaAutomation/
  workon test3
  title "Churros+MSTR"
  subl -b .
  subl -a ../churros-sauce/
  subl -a ../mstr_config/
  change_churros_mstr
}

function goto_circleci {
  cd /Users/keith/dev/cloud-elements/qaAutomation/
  workon test3
  title "CircleCI"
  subl -b .
  subl -a ../churros-sauce/
  change_churros_circleci
}

# CHURROS
function goto_churros {
  cd /Users/keith/dev/cloud-elements/churros/
  title CHURROS
  subl -b .
  subl -a ../churros-sauce/
}


function change_churros_mstr {
  export CHURROS_USER=developer+thanos@cloud-elements.com
  export CHURROS_PASSWORD="cloud99"
  export CHURROS_URL=staging.cloud-elements.com
  export MSTR_CONFIG_PATH=~/dev/cloud-elements/mstr_config
  export MSTR_RALLY_USERNAME='kknapp@microstrategy.com'
  export MSTR_RALLY_PASSWORD='sMT49RTwwGm2B2K'
  export MSTR_RALLY_URL='https://rally1.rallydev.com'
  export MSTR_RALLY_API_KEY='_e3dU3zxrQkuYSLOUHF3LpF4hhQ7SkBtlcYGV0lVzg4'
  export MSTR_RALLY_SSO_URL='https://sso.rallydev.com/sp/startSSO.ping?PartnerIdpId=https://www.usher.com/15064'
  echo 'SET VARIABLES:'
  echo '         username: '$CHURROS_USER
  echo '         password: '$CHURROS_PASSWORD
  echo '              url: '$CHURROS_URL
  echo '      mstr_config: '$MSTR_CONFIG_PATH
  echo '   rally username: '$MSTR_RALLY_USERNAME
  echo '        rally url: '$MSTR_RALLY_URL
  echo '    rally api key: '$MSTR_RALLY_API_KEY
  echo ''
  echo 'INIT CHURROS:'
  churros init --template ~/dev/cloud-elements/churros-sauce/sauce.json
}

function change_churros_circleci {
  export CHURROS_USER=claude.elements.qa+circleci@gmail.com
  export CHURROS_PASSWORD="Cl0ud3l3m3nts!"
  export CHURROS_URL=snapshot.cloud-elements.com
  echo 'SET VARIABLES:'
  echo '         username: '$CHURROS_USER
  echo '         password: '$CHURROS_PASSWORD
  echo '              url: '$CHURROS_URL
  echo ''
  echo 'INIT CHURROS:'
  churros init --template ~/dev/cloud-elements/churros-sauce/sauce.json
}

function change_churros_qa {
  export CHURROS_USER=claude.elements.qa+churros@gmail.com
  export CHURROS_PASSWORD="Cl0ud3l3m3nts!"
  export CHURROS_URL=staging.cloud-elements.com
  echo 'SET VARIABLES:'
  echo '         username: '$CHURROS_USER
  echo '         password: '$CHURROS_PASSWORD
  echo '              url: '$CHURROS_URL
  echo ''
  echo 'INIT CHURROS:'
  churros init --template ~/dev/cloud-elements/churros-sauce/sauce.json
}

function change_churros_models_snap {
  export CHURROS_USER=claude.elements.qa+models@gmail.com
  export CHURROS_PASSWORD="Cl0ud3l3m3nts!"
  export CHURROS_URL=snapshot.cloud-elements.com
  echo 'SET VARIABLES:'
  echo '         username: '$CHURROS_USER
  echo '         password: '$CHURROS_PASSWORD
  echo '              url: '$CHURROS_URL
  echo ''
  echo 'INIT CHURROS:'
  churros init --template ~/dev/cloud-elements/churros-sauce/sauce.json
}

function change_churros_qa_snapshot {
  export CHURROS_USER=claude.elements.qa+general@gmail.com
  export CHURROS_PASSWORD="Cl0ud3l3m3nts!"
  export CHURROS_URL=snapshot.cloud-elements.com
  echo 'SET VARIABLES:'
  echo '         username: '$CHURROS_USER
  echo '         password: '$CHURROS_PASSWORD
  echo '              url: '$CHURROS_URL
  echo ''
  echo 'INIT CHURROS:'
  churros init --template ~/dev/cloud-elements/churros-sauce/sauce.json
}

function change_churros_qa_prod {
  export CHURROS_USER=claude.elements.qa+polling@gmail.com
  export CHURROS_PASSWORD="Cl0ud3l3m3nts!"
  export CHURROS_URL=api.cloud-elements.com
  echo 'SET VARIABLES:'
  echo '         username: '$CHURROS_USER
  echo '         password: '$CHURROS_PASSWORD
  echo '              url: '$CHURROS_URL
  echo ''
  echo 'INIT CHURROS:'
  churros init --template ~/dev/cloud-elements/churros-sauce/sauce.json
}

function change_churros_nightly {
  export CHURROS_USER=churros@churros.com
  export CHURROS_PASSWORD="elements1"
  export CHURROS_URL=snapshot.cloud-elements.com
  echo 'SET VARIABLES:'
  echo '  username:       '$CHURROS_USER
  echo '  password:       '$CHURROS_PASSWORD
  echo '  url:            '$CHURROS_URL
  echo ''
  echo 'INIT CHURROS:'
  churros init --template ~/dev/cloud-elements/churros-sauce/sauce.json
}

# DANGO
function goto_dango {
  cd /Users/keith/dev/cloud-elements/dango/
  title DANGO
}

# CHASE
function goto_chase {
  cd ~/dev/personal/acct_parser/
  subl chase.CSV
  find ~/Downloads -name "Chase*.CSV" -type f -exec rm {} \;
}
#----------------------------------------------------------------------------------
# End GOTO Functions
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# Kill Process Functions, Will kill all processes with a specific name
#----------------------------------------------------------------------------------
# General Kill Function
kill_process () {
  ps aux | grep $1 | grep port | tr -s ' ' | cut -d ' ' -f 2 | while read x; do kill -9 $x; done
}

# CHROMEDRIVER
function kill_chromedriver {
  kill_process chromedriver
}

# PHANTOMJS
function kill_phantomjs {
  kill_process phantomjs
}
#----------------------------------------------------------------------------------
# End Kill Functions
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# MISC Functions
#----------------------------------------------------------------------------------
# Sets the title of the current tab
function title {
    echo -ne "\033]0;"$*"\007"
}

# Returns the date in "{MONTH} {DAY}" Format
function today {
  local myDate=$(date | tr -s ' ' | cut -d ' ' -f 2,3)
  echo "$myDate"
}

# Run Speed Tester
function run_speed_tester {
  cd ~/dev/personal/my_tools/
  workon myTools
  title "Network Speed"
  ./speed_tester.py
}

# Clear out the CE Request Bin
function clear_request_bin {
  curl -X DELETE 'https://knappkeith.pythonanywhere.com/request/?clearQueue' -H 'cache-control: no-cache' -H 'content-type: application/json'
  echo ""
}
#----------------------------------------------------------------------------------
# End MISC Functions
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# Vendor Specific Funtions
#----------------------------------------------------------------------------------
function start_mstr_env() {
  myID=$1
  if [ -z $myID ]
  then
    echo "You must pass an Environment Number"
    return
  fi
  RED="\033[0;31m"
  GREEN="\033[0;32m"
  COLOR_NONE="\033[0m"

  myStatus=$(curl -I https://env-${myID}.customer.cloud.microstrategy.com/MicroStrategy/servlet/mstrWeb 2>/dev/null | head -n 1 | cut -d$' ' -f2)
  if [ "$myStatus" -ne "503" ]
  then
    echo "Environment is up and running! (${myStatus})"
    return
  else
    echo "Environment is not running, trying to start now"
  fi


  bash ~/bash/.mstr ${myID}
  echo ""
  echo "Checking Environment status of ${myID}. "
  myStatus=$(curl -I https://env-${myID}.customer.cloud.microstrategy.com/MicroStrategy/servlet/mstrWeb 2>/dev/null | head -n 1 | cut -d$' ' -f2)
  if [ "$myStatus" -eq "503" ]
  then
    state="${RED}"
  else
    state="${GREEN}"
  fi
  printf "  Status : ${state}${myStatus}${COLOR_NONE}"
  echo ""
}
#----------------------------------------------------------------------------------
# END Vendor Specific Funtions
#----------------------------------------------------------------------------------