#!/bin/bash

tasks=("aio-stress -s 15g -r 64k -t 3 temp" "aircrack-ng -w ../inputs/aircrack.txt ../inputs/wpa.cap" "aobench" "apache" "crafty bench quit" "tscp" \
		"stockfish bench" "p7zip b" "bzip2  ../inputs/tmp_linux-5.5.2.tar.xz -v" "zstd ../inputs/zstd_test")

#tasks=("xz ../inputs/xz_test_tmp.txt")
function startServers {
	if [ $1 == "apache" ]; then
		sudo /usr/local/apache2/bin/apachectl -k stop
		sudo rm -f /usr/local/apache2/logs/* 
		sudo /usr/local/apache2/bin/apachectl -k start
	fi
}

for task in "${tasks[@]}"; do
	taskName=$(echo ${task} | awk '{print $1}')

	if [ $taskName == "bzip2" ]; then
		cp ../inputs/linux-5.5.2.tar.xz ../inputs/tmp_linux-5.5.2.tar.xz
	fi

	if [ $taskName == "xz" ]; then
		cp ../inputs/xz_test ../inputs/xz_test_tmp
	fi

	if [ $taskName == "apache" ]; then
		startServers $task
		time (ab -n 1000000 -c 100 http://localhost:80/) 2> ../results/time_${taskName}.txt
	else	
		time (../tasks/${taskName}/${task}) 2> ../results/time_${taskName}.txt
	fi

	if [ -f temp ] || [ -f ao.ppm ] || [ -f game.001] || [ -f log.001 ] \
	|| [ -f ../inputs/tmp_linux-5.5.2.tar.xz.bz2 ] || [ -f ../inputs/zstd_test ] \
	|| [ -f ../inputs/xz_test_tmp.xz ]; then
		rm temp ; rm ao.ppm ; rm -f game.* ; rm -f log.*
		rm ../inputs/tmp_linux-5.5.2.tar.xz.bz2 ; rm ../inputs/zstd_test.zst; rm ../inputs/xz_test_tmp.xz
	fi
done

echo "Done with all"
