export EDITOR=vim

alias l="ls"
alias ll="ls -la"
alias la="ls -a"
alias t="tar"
alias tv="tar xzvf"
alias tb="tar xjvf"
alias dw="cd ~/Downloads/"
alias chrome="google-chrome 2>/dev/null"
alias emacs="emacs23 -nw"
alias pdf="evince"
alias c="fasd_cd -d"
alias vba="gvba"
alias rand='xrandr --output CRT1 --primary --output LVDS --off'
export PATH=$PATH:/home/sharad/.lib/arduino-1.0.1
export PATH=$PATH:/home/sharad/.lib/eclipse
export PATH=$PATH:/home/sharad/.lib/scala-2.9.2/bin
export PATH=$PATH:/home/sharad/.lib/go/bin
export PATH=$PATH:/home/sharad/.lib/mars
export PATH=$PATH:/home/sharad/.lib/pokemon-online
export PATH=$PATH:/home/sharad/.lib/logisim
export PATH=$PATH:/home/sharad/.lib/ndk
export PATH=$PATH:/home/sharad/android-sdks/platform-tools/
export PATH=$PATH:/home/sharad/android-sdks/tools/
export GOROOT=~/.lib/go

alias gr="go run"
alias gc="go build"
function wk () 
{
  cd ~/workspace/$1
}
function hack () 
{
  cd ~/workspace/hacks/$1
}
export PATH=$PATH:$HOME/.cabal/bin # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/scripts
alias settings='gnome-control-center'
eval "$(fasd --init auto)"
alias v='f -e vim'
. ~/.bash_aliases
#~/.fortune
alias sl="sl -Fa"
alias SLEEP=sleep

export JAVA_HOME=/usr/lib/jvm/default-java
export ANDROID_SDK=${HOME}/adt/sdk
export ANDROID_NDK=${HOME}/adt/ndk
export ANDROID_HOME=$ANDROID_SDK
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/home/sharadmv/lib/idea/bin:$PATH"
export PATH=$PATH:$JAVA_HOME/bin:$ANDROID_SDK/tools:${ANDROID_SDK}/platform-tools
export ARCHDIR=/home/sharad/workspace/lib/mips-x86.linux-xgcc
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
alias startx="cd && startx"
