function install_jetbrains_mono(){
	log "Install 'Jetbrains Mono'..."
	wget -q -O jetbrains_mono.zip "https://download.jetbrains.com/fonts/JetBrainsMono-1.0.3.zip"
	unzip -j -C jetbrains_mono.zip "*.ttf" -d jetbrains_mono
	cp -a ./jetbrains_mono/. ~/Library/Fonts
}
