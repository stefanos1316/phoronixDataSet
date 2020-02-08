#!/bin/bash

# tasks=("aio-stress -s 15g -r 64k -t 3 temp" "aircrack-ng -w ../inputs/aircrack.txt ../inputs/wpa.cap" "aobench" "apache" "crafty bench quit" "tscp" \
# 		"stockfish bench" "p7zip b" "bzip2  ../inputs/tmp_linux-5.3.tar.gz -v" "zstd ../inputs/zstd_test" "xz ../inputs/tmp_xz.txt" "byte register" \
# 		"byte dhry2" "byte int" "byte float" "scimark2" "fhourstones" "gmpbench" "dcraw ../tasks/dcraw/DSC_50*" \
# 		"nero2d ../inputs/nero2d.igf" "minions ../inputs/minions.minion" "hmmr -E 0.1 ../inputs/Pfam_ls ../inputs/7LES_DROME" \
# 		"mafft --thread 1 --localpair --maxiterate 1000000 ../inputs/pyruvate_decarboxylase.fasta" "povray -benchmark <<< 1" \
# 		"rodinia euler3d_cpu_double ../../inputs/missile.domn.0.2M" "rodinia lavaMD -cores $(nproc --all) -boxes1d 48" \
# 		"rodinia sc_omp 10 30 512 65536 65536 2000 none output.txt $(nproc --all) && rm output.txt" "openssl speed rsa4096" \
#		"x264  -o /dev/null --slow --threads $(nproc --all) ../inputs/Bosphorus_1920x1080_120fps_420_8bit_YUV.y4m" \
# 		"x265 ../inputs/Bosphorus_1920x1080_120fps_420_8bit_YUV.y4m  /dev/null" "build-linux-kernel" "build-gcc" "ctx_clock" \
#		"sysbench cpu --cpu-max-prime=20000000 --threads=8 run" "sysbench memory --memory-total-size=100G --threads=8 run" \
#		"blake2 100" "blogbench read -d ./ -i 5" "blogbench write -d ./ -i 5" "c-ray -t $(nproc --all) -s 3840x2160 -r 16 -i ../inputs/sphfract -o output.ppm" \ 
#		"cachebench read -r -m 9" "cachebench write -w -m 9" "cachebench mixed -b -m 9" "cachebench memset -s -m 9" "cachebench memcpy -p -m 9" \
#		"cloverleaf" "brlcad run -P $(nproc --all)")
#tasks=("dacapo eclipse java -jar dacapo.jar -t $(nproc --all) --window 10 eclipse" "dacapo h2 java -jar dacapo.jar -t $(nproc --all) --window 10 h2" \ 
# "dacapo jython java -jar dacapo.jar -t $(nproc --all) --window 10 jython" "dacapo tradebeans java -jar dacapo.jar -t $(nproc --all) --window 10 tradebeans" \ 
# "dacapo tradesoap java -jar dacapo.jar -t $(nproc --all) --window 10 tradesoap")

tasks=("cpp-perf-bench stepanov_abstraction" "cpp-perf-bench stepanov_vector" "cpp-perf-bench functionobjects" "cpp-perf-bench atol" "cpp-perf-bench ctype" \
		"cpp-perf-bench mathlib" "cpp-perf-bench random_numbers")

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
	local minutes=`grep real ${filePath} | tail -1 | awk {'print $2'} | awk -F'm' '{print $1}'`
	local seconds=`grep real ${filePath} | tail -1 | awk {'print $2'} | awk -F'm' '{print $2}' | awk -F',' '{print $1}'`
	if [ $minutes -ne 0 ]; then
		minutes=$((minutes * 60))
	fi
			
	totalTime=$((minutes + seconds))
}

function dumpGarbage {
	if [ -f temp ] || [ -f ao.ppm ] || [ -f game.001 ] || [ -f log.001 ] \
	|| [ -f ../inputs/tmp_linux-5.3.tar.gz.bz2 ] || [ -f ../inputs/zstd_test ] \
	|| [ -f ../inputs/tmp_xz.txt.xz ] || [ -f *.tmp] || [ -f RES-multiply-* ] \
	|| [ -f ../tasks/dcraw/*.ppm ] || [ -f bitmap0_* ] || [-f blog-* ] \
	|| [ -f alltext.out ] || [ -f output.ppm ] || [-f clover.* ] ; then
		rm temp ; rm ao.ppm ; rm game.* ; rm log.* ; rm *.tmp
		rm ../inputs/tmp_linux-5.3.tar.gz.bz2 ; rm ../inputs/zstd_test.zst
		rm ../inputs/tmp_xz.txt.xz ; rm RES-multiply-* ; rm ../tasks/dcraw/*.ppm 
		rm bitmap0_* ; rm -rf blog-* ; rm  alltext.out ; rm output.ppm
		rm clover.*
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

sudo bash ../tools/governor.sh pe

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
			cp ../inputs/linux-5.3.tar.gz ../inputs/tmp_linux-5.3.tar.gz
			time (../tasks/${benchmark}/${task}) 2> ../results/time_${taskName}.txt ;;
		("xz")
			cp ../inputs/xz.txt ../inputs/tmp_xz.txt
			time (../tasks/${benchmark}/${task}) 2> ../results/time_${taskName}.txt ;;
		("gmpbench")
			cd ../tasks/${benchmark}
			time (./${task}) 2> ../../results/time_${taskName}.txt
			cd ../../scripts ;;
		("sudokut.sh")
			cd ../tasks/${benchmark}
			time (./${task}) 2> ../../results/time_${taskName}.txt
			cd ../../scripts ;;
		("build-linux-kernel")
			tar -xzvf ../inputs/linux-5.3.tar.gz
			mv ./linux-5.3 ../tasks/${benchmark}
			cd ../tasks/${benchmark}
			time (./${task}) 2> ../../results/time_${taskName}.txt
			rm -rf ./linux-5.3
			cd ../../scripts ;;
		("build-gcc")
			tar -xzvf ../inputs/gcc-8.2.0.tar.gz
			mv ./gcc-8.2.0 ../tasks/${benchmark}
			cd ../tasks/${benchmark}
			time (./${task}) 2> ../../results/time_${taskName}.txt
			rm -rf ./gcc-8.2.0
			cd ../../scripts ;;
		("cloverleaf")
			cp ../inputs/clover.in ./
			time (../tasks/${benchmark}/${task}) 2> ../results/time_${taskName}.txt ;;
		("povrays")
			time (../tasks/${benchmark}/${task} <<< 1) 2> ../results/time_${taskName}.txt ;;
		("brlcad")
			cd ../tasks/${benchmark}
			time (./${task}) 2> ../../results/time_${taskName}.txt
			cd ../../scripts ;;
		cpp-perf-bench*)
			cd ../tasks/${benchmark}
			time (./${task}) 2> ../../results/time_${taskName}.txt
			cd ../../scripts ;;	
		rodinia*)
			cd ../tasks/${benchmark}
			time (./${task}) 2> ../../results/time_${taskName}.txt
			cd ../../scripts ;;
		byte*)
			cd ../tasks/byte
			time (./${task}) 2> ../../results/time_${taskName}.txt
			cd ../../scripts ;;
		(*) time (../tasks/${benchmark}/${task}) 2> ../results/time_${taskName}.txt ;;
	esac

	getTimeInSeconds ../results/time_${taskName}.txt
	echo "${taskName}		${totalTime}" >> ../results/time.txt
done

dumpGarbage

echo "Done with all"
