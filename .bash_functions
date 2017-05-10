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
  cd /Users/keith/dev/cloud-elements/tools-ce/
  workon tools
  title ceTOOLS
}

# CHURROS
function goto_churros {
  cd /Users/keith/dev/cloud-elements/churros/
  title CHURROS
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
#----------------------------------------------------------------------------------
# End MISC Functions
#----------------------------------------------------------------------------------
