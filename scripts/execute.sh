#!/bin/bash

# tasks=("aio-stress -s 15g -r 64k -t 3 temp" "aircrack-ng -w ../inputs/aircrack.txt ../inputs/wpa.cap" "aobench" "apache" "crafty bench quit" "tscp" \
# 		"stockfish bench" "p7zip b" "bzip2  ../inputs/tmp_linux-5.5.2.tar.xz -v" "zstd ../inputs/zstd_test" "xz ../inputs/xz_test_tmp.txt" "byte register"\
# 		)

tasks=("byte register")
# note: use a single time file and write the taskName with arguments.
# Check array if more exist with the same name compbine with last argument (testcase)
function startServers {
	if [ $1 == "apache" ]; then
		sudo /usr/local/apache2/bin/apachectl -k stop
		sudo rm -f /usr/local/apache2/logs/* 
		sudo /usr/local/apache2/bin/apachectl -k start
	fi
}

for task in "${tasks[@]}"; do

	taskName=$(echo ${task} | awk '{print $1}')
	case "$taskName" in
		("apache") 
			startServers $task
			time (ab -n 1000000 -c 100 http://localhost:80/) 2> ../results/time_${taskName}.txt ;;
		("bzip2")
			cp ../inputs/linux-5.5.2.tar.xz ../inputs/tmp_linux-5.5.2.tar.xz
			time (../tasks/${taskName}/${task}) 2> ../results/time_${taskName}.txt ;;
		("xz")
			cp ../inputs/xz_test ../inputs/xz_test_tmp
			time (../tasks/${taskName}/${task}) 2> ../results/time_${taskName}.txt ;;
		("byte")
			cd ../tasks/byte/
			time (./${task}) 2> ../../results/time_${taskName}.txt
			cd ../../scripts/ ;;
		(*) time (../tasks/${taskName}/${task}) 2> ../results/time_${taskName}.txt ;;
	esac

	if [ -f temp ] || [ -f ao.ppm ] || [ -f game.001 ] || [ -f log.001 ] \
	|| [ -f ../inputs/tmp_linux-5.5.2.tar.xz.bz2 ] || [ -f ../inputs/zstd_test ] \
	|| [ -f ../inputs/xz_test_tmp.xz ] || [ -f *.tmp] ; then
		rm temp ; rm ao.ppm ; rm game.* ; rm log.* ; rm *.tmp
		rm ../inputs/tmp_linux-5.5.2.tar.xz.bz2 ; rm ../inputs/zstd_test.zst; rm ../inputs/xz_test_tmp.xz
	fi
done

echo "Done with all"
