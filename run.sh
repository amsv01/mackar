#!/usr/bin/env bash

function brew_install() {
  if [[ ! $(brew ls --versions $1) ]] ; then
    brew install $1
  fi
  echo "$1 has been installed!"
}

#echo 'password' | sudo -S COMMAND
if [[ ! $(which brew) ]] ; then
  xcode-select --install
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew_install "curl"

brew_install "zsh"

brew_install "git"

brew_install "vim"

brew_install "neovim"

echo "| Install oh-my-zsh and copy configuration"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone "https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
cp ./my.zshrc ~/.zshrc

brew_install "z"


