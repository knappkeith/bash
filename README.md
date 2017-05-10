#  BASH Settings

I am new to this but have found it useful to make these available.  They are pretty tailored to me and my computer, mostly because I dont know yet how to fix it all.  If you have any questions or suggestions please let me know.

## How to Use

1. Fork this repo
2. From your home directory, ```git clone <YOUR FORK>```
3. Add to your ```.bashrc``` or ```.bash_profile```:
  * ```source /Users/<USER PROFILE>/bash/.bash_start``` or ```source ~/bash/.bash_start```
4. Restart your terminal

## What does it do

* Git, will show your current branch and it's status at the end of the prompt
* Python Virtual Environments, will show at the beginning of the prompt
* Programs setup
  * UnRar, for more Info see below
  * Docker and Boot2Docker, basic setup, see www.docker.com for more info
  * Sublime, to be able to use ```subl```, will need symlink
    * run: ```$ ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl```
  * JAVA, might have to update for your version of JDK
  * Maven, might have to update for your version
  * Tomcat, might have to update for your version
  * Kafka, might have to update for your version
  * Ngrok
  * RVM
* Functions:
  1. title - will take the passed string and set the title of the tab to it
    ```title I want a Pony!!!```

## More Info

### .bash_private

Because there are some things that you don't want to store on a publicly available Repo you can set things in here and this scipt will get run first.

### UnRAR

UnRAR is a command line tool to extract RAR files and is needed for the ```unrar``` python library

To install:

1. Goto http://www.rarlab.com/download.htm and download the most recent version
2. Extract tar and go into directory
3. ```$ sudo install -c -o $USER unrar /usr```
4. ```$ sudo install -c -o $USER rar /usr```
