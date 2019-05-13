#!/bin/bash
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

# Remove all *.pyc and __pycache__
pyclean () {
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
}
#----------------------------------------------------------------------------------
# End Python Functions
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# GOTO functions: Navigates to correct Directory, sets up needed environment,
#   sets title, and any other needed setup
#----------------------------------------------------------------------------------
# CHASE
function goto_chase {
  cd ~/dev/personal/chase/
  subl .
  find ~/Downloads -name "Chase*.CSV" -type f -exec rm {} \;
}
function goto_2fa {
  cd ~/dev/personal/two-factor-auth-automation
  workon 2factor
  subl .
  title "2FA"
  export CREDS_PATH='~/2fa_creds.json'
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