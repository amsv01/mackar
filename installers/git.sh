function install_git(){
  log "Installing 'git'..."
  brew_install "git"

  log "Installing 'ctags'..."
  brew_install "ctags"
}