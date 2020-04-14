function install_sublime(){
  log "Installing 'Sublime 3'..."
  brew_cask_install "sublime-text"
  cp "./$CONFIG_DIR/my.sublime-settings" "~/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
}