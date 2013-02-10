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
alias pdf="acroread"
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
PATH=$PATH:$HOME/.cabal/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
alias settings='gnome-control-center'
eval "$(fasd --init auto)"
alias v='f -e vim'
. ~/.bash_aliases
#~/.fortune
alias sl="sl -Fa"
alias SLEEP=sleep

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
function cinnamon() {
    rm ~/.xinitrc
    startx
}
function xmonad() {
    rm ~/.xinitrc
    ln -s ~/dotfiles/xmonad.rc ~/.xinitrc
    startx
}
