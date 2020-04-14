function install_ohmyzsh(){
	log "Installing 'zsh'..."
	brew_install "zsh"

	log "Installing oh-my-zsh and copy configuration..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone "https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
	cp "./$CONFIG_DIR/my.zshrc" ~/.zshrc
}
