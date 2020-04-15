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
  log.installing "Homebrew"
  if [[ ! $(which brew) ]] ; then
    xcode-select --install
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap caskroom/cask
  fi
  log.installed "Hombrew"
}

# Read installers and make an array of them
installer_file_list=$(ls ./installers | sed -e 's/\.sh$//')
read -a installers <<< ${installer_file_list}
installer_count=${#installers[@]}

install_brew

for i in ${!installers[@]}; do
	installer=${installers[i]}
  source "./installers/$installer.sh"
done