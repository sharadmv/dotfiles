export EDITOR=vim

eval "$(fasd --init auto)"

export PATH=$PATH:/home/sharad/android-sdks/platform-tools/
export PATH=$PATH:/home/sharad/android-sdks/tools/
export PATH=$PATH:/home/sharad/android-sdks/tools/
export PATH=$PATH:$HOME/bin/
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/lib/ec2-api-tools/bin

export PATH="/home/sharadmv/lib/idea/bin:$PATH"
export PATH="/home/sharadmv/lib/scala/bin:$PATH"
export PATH="/home/sharadmv/lib/shark/bin:$PATH"
export PATH="/usr/bin/sphinx/bin:$PATH"
export WORKON_HOME=~/.envs

export GOROOT=$HOME/lib/go
export PATH=$PATH:$GOROOT/bin

export HIVE_HOME="/home/sharadmv/lib/hive/"
export SCALA_HOME="/home/sharadmv/lib/shark"

export JAVA_HOME=/usr/lib/jvm/default-java
export ANDROID_SDK=${HOME}/adt/sdk
export ANDROID_NDK=${HOME}/adt/ndk
export ANDROID_HOME=$ANDROID_SDK
export PATH=$PATH:$JAVA_HOME/bin:$ANDROID_SDK/tools:${ANDROID_SDK}/platform-tools

export ARCHDIR=/home/sharad/workspace/lib/mips-x86.linux-xgcc
export PATH="/usr/local/heroku/bin:$PATH"

export GOROOT=~/.lib/go

function work () 
{
  cd ~/workspace/$1
}
function hack () 
{
  cd ~/workspace/hacks/$1
}

function cinnamon() {
    rm ~/.xinitrc
    startx
}
function xmonad() {
    rm ~/.xinitrc
    ln -s ~/dotfiles/xmonad.rc ~/.xinitrc
    cd ~
    startx
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
#export PATH="/home/sharad/lib/google_appengine/:$PATH"
#export PYTHONPATH="/home/sharad/lib/google_appengine/:$PYTHONPATH"
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
source ~/.bash_aliases
#source ~/.bash_git

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export TERM=xterm-256color
source /usr/local/bin/virtualenvwrapper.sh
export PATH=$PATH:/home/local/ANT/sharadv/lib/mendeleydesktop/bin/
