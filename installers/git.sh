#!/usr/bin/env bash
function install_git(){
  log "Installing 'git'..."
  brew_install "git"

  log "Installing 'ctags'..."
  brew_install "ctags"

	echo "Set a global ignore file for git"
  git config --global core.excludesfile ./config/.gitignore_global
}