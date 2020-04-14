#!/usr/bin/env bash

#echo 'password' | sudo -S COMMAND
source ./.env
source ./console.sh
source ./installers.sh

mkdir ./temp || exit
cd ./temp || exit

log "Load new zshrc"
source ~/.zshrc

