#!/usr/bin/env bash
function install_miniconda(){
	cd ./temp || exit 1
	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
	bash ~/miniconda.sh -b -p $HOME/miniconda
	conda init
	cd ..
}
