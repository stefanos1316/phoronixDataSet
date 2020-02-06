#!/bin/bash

tasks=("aio-stress -s 15g -r 64k -t 3 temp" "aircrack-ng -w ../inputs/aircrack.txt ../inputs/wpa.cap")

for task in "${tasks[@]}"; do
	taskName=$(echo ${task} | awk '{print $1}')
	time (../tasks/${taskName}/${task}) 2> ../results/time_${taskName}.txt
	
	if [ -f temp ]; then
		rm temp
	fi
done

echo "Done with all"
