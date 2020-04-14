function install_vscode(){
  log "Installing 'VSCode'..."
  brew_cask_install "visual-studio-code"
  cp "./$CONFIG_DIR/myvscode.json" "~/Library/Application Support/Code/User/settings.json"
}