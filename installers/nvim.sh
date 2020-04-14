function install_nvim(){
	log "Installing 'neovim'..."
	brew_install "neovim"
	pip install flake8 jedi
	pip3 install --user --upgrade neovim
	curl 'https://vim-bootstrap.com/generate.vim' --data 'editor=nvim&langs=javascript&langs=typescript&langs=html' > $XDG_CONFIG_HOME/nvim/init.vim
}
