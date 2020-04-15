#!/usr/bin/env bash

function brew_install() {
  if [[ ! $(brew ls --versions $1) ]] ; then
    brew install $1
    log "$1 has been installed!"
  else
    log "$1 is already installed!"
  fi
}

function brew_cask_install() {
  if [[ ! $(brew ls --versions $1) ]] ; then
    brew cask install $1
    log "$1 has been installed!"
  else
    log "$1 is already installed!"
  fi
}

function install_brew(){
  if [[ ! $(which brew) ]] ; then
    xcode-select --install
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap caskroom/cask
  fi
  log "Hombrew has been installed!"
}


install_brew

for installer in ./installers/*
do
  source "$entry"
  eval "install_$entry"
done

# source ./brew.sh
# source ./curl.sh
# source ./wget.sh
# source ./axel.sh
# source ./jetbrains_mono.sh
# source ./ohmyzsh.sh
# source ./bat.sh
# source ./z.sh
# source ./fzf.sh
# source ./z.sh
# source ./vscode.sh
# source ./sublime.sh
# source ./tig.sh
