#!/bin/bash

tasks=("aio-stress -s 15g -r 64k -t 3 temp" "aircrack-ng -w ../inputs/aircrack.txt ../inputs/wpa.cap" "aobench" "apache")
function startServers {
	if [ $1 == "apache" ]; then
		sudo /usr/local/apache2/bin/apachectl -k stop
		sudo rm -f /usr/local/apache2/logs/* 
		sudo /usr/local/apache2/bin/apachectl -k start
	fi
}

for task in "${tasks[@]}"; do
	taskName=$(echo ${task} | awk '{print $1}')

	if [ $task == "apache" ]; then
		startServers $task
		time (ab -n 1000000 -c 100 http://localhost:80/) 2> ../results/time_${taskName}.txt
	else	
		time (../tasks/${taskName}/${task}) 2> ../results/time_${taskName}.txt
	fi

	if [ -f temp ] && [ -f ao.ppm ]; then
		rm temp
		rm ao.ppm
	fi
done

echo "Done with all"
