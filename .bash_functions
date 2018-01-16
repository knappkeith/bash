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

# CHURROS
function goto_churros {
  cd /Users/keith/dev/cloud-elements/churros/
  title CHURROS
}

function change_churros_qa {
  export CHURROS_USER=claude.elements.qa+churros@gmail.com
  export CHURROS_PASSWORD="Cl0ud3l3m3nts!"
  export CHURROS_URL=staging.cloud-elements.com
  echo $CHURROS_USER
  echo $CHURROS_PASSWORD
  echo $CHURROS_URL
  churros init --template ~/dev/cloud-elements/churros-sauce/sauce.json
}

function change_churros_qa_snapshot {
  export CHURROS_USER=claude.elements.qa+general@gmail.com
  export CHURROS_PASSWORD="Cl0ud3l3m3nts!"
  export CHURROS_URL=snapshot.cloud-elements.com
  echo $CHURROS_USER
  echo $CHURROS_PASSWORD
  echo $CHURROS_URL
  churros init --template ~/dev/cloud-elements/churros-sauce/sauce.json
}

function change_churros_qa_prod {
  export CHURROS_USER=claude.elements.qa+polling@gmail.com
  export CHURROS_PASSWORD="Cl0ud3l3m3nts!"
  export CHURROS_URL=api.cloud-elements.com
  echo $CHURROS_USER
  echo $CHURROS_PASSWORD
  echo $CHURROS_URL
  churros init --template ~/dev/cloud-elements/churros-sauce/sauce.json
}

function change_churros_nightly {
  export CHURROS_USER=churros@churros.com
  export CHURROS_PASSWORD="elements1"
  export CHURROS_URL=snapshot.cloud-elements.com
  echo $CHURROS_USER
  echo $CHURROS_PASSWORD
  echo $CHURROS_URL
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
  ps aux | grep $1 | grep utils | tr -s ' ' | cut -d ' ' -f 2 | while read x; do kill -9 $x; done
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
