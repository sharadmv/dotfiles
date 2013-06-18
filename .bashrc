export EDITOR=vim

. ~/.bash_aliases
eval "$(fasd --init auto)"

export PATH=$PATH:/home/sharad/android-sdks/platform-tools/
export PATH=$PATH:/home/sharad/android-sdks/tools/
export PATH=$PATH:$HOME/.cabal/bin 
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/lib/ec2-api-tools/bin

export PATH="/home/sharadmv/lib/idea/bin:$PATH"

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
