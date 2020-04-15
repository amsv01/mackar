#!/bin/bash

#source ./progressbar.sh
source ./console.sh
#for pc in $(seq 1 100); do
#    echo -ne "$pc%\033[0K\r"
#    sleep 1
#done
#echo
#

function progress(){
	start=$1
	end=$2
	progress=$((start * 20 / end))
	__progressbar="["
	for i in $(seq 0 20); do
		if [[ ${i} -lt $((progress + 1)) ]]; then
			__progressbar="${__progressbar}#"
		else
			__progressbar="${__progressbar}-"
		fi
	done
	echo "\033[s"
	tput cup $(tput lines) 10
	__progressbar="${__progressbar}]"
	printf "%s\n" ${__progressbar}
	echo "\033[u"
}

progress 4 20
sleep 1
progress 5 20
#progress "In progress" 1 20
#logOut "Line 1"
#logOut "Line 2"
#logOut "Line 3"
#sleep 0.1
#progress "In progress" 5 20
#logOut "Line 4"
#logOut "Line 5"
#logOut "Line 6"
#sleep 0.1
#progress "In progress" 10 20



#echo "Line 4"
#echo "Line 5"
#moveNUp 2 "Line Sample"
#echo "\033[5ALine 6"


