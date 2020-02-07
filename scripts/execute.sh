#!/bin/bash

# tasks=("aio-stress -s 15g -r 64k -t 3 temp" "aircrack-ng -w ../inputs/aircrack.txt ../inputs/wpa.cap" "aobench" "apache" "crafty bench quit" "tscp" \
# 		"stockfish bench" "p7zip b" "bzip2  ../inputs/tmp_linux-4.3.tar.gz -v" "zstd ../inputs/zstd_test" "xz ../inputs/tmp_xz.txt" "byte register" \
# 		"byte dhry2" "byte int" "byte float" "scimark2" "fhourstones")

tasks=("fhourstones")
# Check array if more exist with the same name combine with last argument (testcase)
function startServers {
	if [ $1 == "apache" ]; then
		sudo /usr/local/apache2/bin/apachectl -k stop
		sudo rm -f /usr/local/apache2/logs/* 
		sudo /usr/local/apache2/bin/apachectl -k start
	fi
}

function getTimeInSeconds {
	local filePath=$1
	local minutes=`grep real ${filePath} | awk {'print $2'} | awk -F'm' '{print $1}'`
	local seconds=`grep real ${filePath} | awk {'print $2'} | awk -F'm' '{print $2}' | awk -F',' '{print $1}'`
	if [ $minutes -ne 0 ]; then
		minutes=$((minutes * 60))
	fi
			
	totalTime=$((minutes + seconds))
}

function dumpGarbage {
	if [ -f temp ] || [ -f ao.ppm ] || [ -f game.001 ] || [ -f log.001 ] \
	|| [ -f ../inputs/tmp_linux-4.3.tar.gz.bz2 ] || [ -f ../inputs/zstd_test ] \
	|| [ -f ../inputs/tmp_xz.txt.xz ] || [ -f *.tmp] ; then
		rm temp ; rm ao.ppm ; rm game.* ; rm log.* ; rm *.tmp
		rm ../inputs/tmp_linux-4.3.tar.gz.bz2 ; rm ../inputs/zstd_test.zst; rm ../inputs/tmp_xz.txt.xz
	fi
}

# Caution: for the above to work the alternative scenarios
# of the bench suite must be immediatly after the bench's name
function checkIfSubstringExistsMoreTimesInArray {
	local substring=$1
	local count=0
	local task
	for i in "${tasks[@]}"; do
		if [[ "$i" == *"$substring"* ]]; then
			count=$((count+1))
		fi
	done

	if [  $count -gt 1 ]; then
		task=`echo $2`
		taskName=`echo ${taskName}_${task}`
	fi
}

for task in "${tasks[@]}"; do

	taskName=`echo ${task} | awk '{print $1}'`
	benchmark=${taskName}
	checkIfSubstringExistsMoreTimesInArray ${task}

	totalTime=0
	case "$taskName" in
		("apache") 
			startServers $task
			time (ab -n 1000000 -c 100 http://localhost:80/) 2> ../results/time_${taskName}.txt
			getTimeInSeconds ../results/time_${taskName}.txt ;;
		("bzip2")
			cp ../inputs/linux-4.3.tar.gz ../inputs/tmp_linux-4.3.tar.gz
			time (../tasks/${benchmark}/${task}) 2> ../results/time_${taskName}.txt ;;
		("xz")
			cp ../inputs/xz.txt ../inputs/tmp_xz.txt
			time (../tasks/${benchmark}/${task}) 2> ../results/time_${taskName}.txt ;;
		byte*)
			echo "Here" 
			cd ../tasks/byte/
			time (./${task}) 2> ../../results/time_${taskName}.txt
			cd ../../scripts/ ;;
		(*) time (../tasks/${benchmark}/${task}) 2> ../results/time_${taskName}.txt ;;
	esac

	getTimeInSeconds ../results/time_${taskName}.txt
	echo "${taskName}		${totalTime}" >> ../results/time.txt
done

dumpGarbage

echo "Done with all"
