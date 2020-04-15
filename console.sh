#!/usr/bin/env bash

CHECK_MARK="\033[0;32m\xE2\x9C\x94\033[0m"

function moveNUp(){
	echo "\033[$1A$2"
}

function moveNDown(){
	echo "\033[$1B$2"
}

function moveNForward(){
	echo "\033[$1C$2"
}

function moveNBackward(){
	echo "\033[$1D$2"
}

function eraseToEnd() {
	echo -n "\033[K"
}

function savePos(){
	echo -en "\033[s"
}

function restorePos(){
#	echo "\033[u$(moveNUp 1)"
	echo -en "\033[u"
}

function getPos(){
	# based on a script from http://invisible-island.net/xterm/xterm.faq.html
	exec < /dev/tty
	oldstty=$(stty -g)
	stty raw -echo min 0
	# on my system, the following line can be replaced by the line below it
	#echo -en "\033[6n" > /dev/tty
	tput u7 > /dev/tty    # when TERM=xterm (and relatives)
	IFS=';' read -r -d R -a pos
	stty $oldstty
	# change from one-based to zero based so they work with: tput cup $row $col
	row=$((${pos[0]:2} - 1))    # strip off the esc-[
	col=$((${pos[1]} - 1))
	return row
}

function log() {
  echo "| $1"
}

function logInstalling(){
  echo -n "Installing $1"
}

function logInstalled(){
  echo -e "\\r${CHECK_MARK} $1 has been installed!"
}

function logOut() {
	echo "${CHECK_MARK} $1 has been installed!"
}

function progress() {
	restorePos
	progressbar $1 $2 $3
	savePos
}