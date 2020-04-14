#!/usr/bin/env bash

#echo 'password' | sudo -S COMMAND
source ./.env
source ./console.sh
source ./installers.sh

function log() {
  echo "| $1"
}

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

if [[ ! $(which brew) ]] ; then
  xcode-select --install
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap caskroom/cask
fi

mkdir ./temp || exit
cd ./temp || exit

log "Installing 'curl'..."
brew_install "curl"

log "Installing 'wget'..."
brew_install "wget"

log "Installing 'axel'..."
brew_install "axel"

log "============================================================"
log "Installing Jetbrains Mono and config it..."
wget -q -O jetbrains_mono.zip "https://download.jetbrains.com/fonts/JetBrainsMono-1.0.3.zip"
unzip -j -C jetbrains_mono.zip "*.ttf" -d jetbrains_mono
cp -a ./jetbrains_mono/. ~/Library/Fonts

log "============================================================"
log "Installing 'zsh'..."
brew_install "zsh"

log "Installing 'git'..."
brew_install "git"

log "Installing 'ctags'..."
brew_install "ctags"

log "Installing oh-my-zsh and copy configuration..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone "https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
cp "./$CONFIG_DIR/my.zshrc" ~/.zshrc

log "Installing 'vim'..."
brew_install "vim"


log "Installing 'Sublime 3'..."
brew_cask_install "sublime-text"
cp "./$CONFIG_DIR/my.sublime-settings" "~/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"

log "Installing 'VSCode'..."
brew_cask_install "visual-studio-code"
cp "./$CONFIG_DIR/myvscode.json" "~/Library/Application Support/Code/User/settings.json"

log "Installing a few useful tools..."
brew_install "z"
brew_install "tig"
brew_install "bat"
brew_install "fzf"

log "Load new zshrc"
source ~/.zshrc

