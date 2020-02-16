#!/bin/bash

# Tasks location file from where you downloaded and installed executables
taskDirectory="tools/tasks_test"

stasks=("aio-stress -s 15g -r 64k -t 3 temp" "aircrack-ng -w ../inputs/aircrack.txt ../inputs/wpa.cap" "aobench" "apache" "nginx" "crafty bench quit" "tscp" \
		"stockfish bench" "p7zip b" "bzip2  ../inputs/tmp_linux-5.3.tar.gz -v" "zstd ../inputs/zstd_test" "xz ../inputs/tmp_xz.txt" "byte register" \
		"byte dhry2" "byte int" "byte float" "scimark2" "fhourstones" "gmpbench" "dcraw ../${taskDirectory}/dcraw/DSC_50*" \
		"sudokut" "nero2d" "minion" "hmmer -E 0.1 ../inputs/Pfam_ls ../inputs/7LES_DROME" \
		"rodinia euler3d_cpu_double ../../inputs/missile.domn.0.2M" "rodinia lavaMD -cores $(nproc --all) -boxes1d 48" \
		"rodinia sc_omp 10 30 512 65536 65536 2000 none output.txt $(nproc --all) && rm output.txt" "openssl speed rsa4096" \
		"x264  -o /dev/null --slow --threads $(nproc --all) ../inputs/Bosphorus_1920x1080_120fps_420_8bit_YUV.y4m" \
		"x265 ../inputs/Bosphorus_1920x1080_120fps_420_8bit_YUV.y4m  /dev/null"  "ctx_clock" \
		"sysbench cpu --cpu-max-prime=20000000 --threads=8 run" "sysbench memory --memory-total-size=100G --threads=8 run" \
		"blake2s 100" "blogbench read -d ./ -i 5" "blogbench write -d ./ -i 5" \
		"c-ray -t $(nproc --all) -s 3840x2160 -r 16 -i ../inputs/sphfract -o output.ppm" "povray -benchmark" \ 
		"cachebench read -r -m 9" "cachebench write -w -m 9" "cachebench mixed -b -m 9" "cachebench memset -s -m 9" "cachebench memcpy -p -m 9" \
		"cloverleaf ../inputs/clover_bm8192.in" "brlcad run -P $(nproc --all)" "cpp-perf-bench stepanov_abstraction" "cpp-perf-bench stepanov_vector" \
		"cpp-perf-bench functionobjects" "cpp-perf-bench atol" "cpp-perf-bench ctype" "cpp-perf-bench mathlib" "cpp-perf-bench random_numbers" \
		"dacapo eclipse java -jar dacapo.jar -t $(nproc --all) --window 10 eclipse" "dacapo h2 java -jar dacapo.jar -t $(nproc --all) --window 10 h2" \
		"dacapo jython java -jar dacapo.jar -t $(nproc --all) --window 10 jython" "dacapo tradebeans java -jar dacapo.jar -t $(nproc --all) --window 10 tradebeans" \
		"dacapo tradesoap java -jar dacapo.jar -t $(nproc --all) --window 10 tradesoap" "ebizzy -S 30" "glibc-bench bench-ffsll" "glibc-bench bench-ffs" \
		"glibc-bench bench-pthread_once" "glibc-bench bench-tanh" "glibc-bench bench-sqrt" "glibc-bench bench-sin" "glibc-bench bench-cos" \
		"glibc-bench bench-asinh" "glibc-bench bench-atanh" "glibc-bench bench-sincos" "glibc-bench bench-sinh" "glibc-bench bench-modf" \
		"glibc-bench bench-exp" "glibc-bench bench-log2" "himeno XL" "hint float" "hint double" "hpcg" "build-linux-kernel"\
		"john-the-ripper bcrypt ./john --test=30 --format=bcrypt" "john-the-ripper md5crypt ./john --test=30 --format=md5crypt" "lammps" \
		"lzbench -ezstd ../inputs/linux-5.3.tar.gz" "lzbench -ebrotli ../inputs/linux-5.3.tar.gz" \
		"lzbench -elibdeflate ../inputs/linux-5.3.tar.gz" "lzbench -exz ../inputs/linux-5.3.tar.gz" "m-queens 2 18" \
		"mbw 128 MiB -n 100 -t2" "mbw 512 MiB -n 100 -t2" "mbw 1024 MiB -n 100 -t2" "mbw 4096 MiB -n 100 -t2" "mbw 8192 MiB -n 100 -t2" \
		"mcperf get ./mcperf --linger=0 --call-rate=0 --num-calls=2000000 --conn-rate=0 --num-conns=1 --sizes=d5120 --method=get" \
		"mcperf set ./mcperf --linger=0 --call-rate=0 --num-calls=2000000 --conn-rate=0 --num-conns=1 --sizes=d5120 --method=set" \
		"mcperf delete ./mcperf --linger=0 --call-rate=0 --num-calls=2000000 --conn-rate=0 --num-conns=1 --sizes=d5120 --method=delete" \
		"mcperf add ./mcperf --linger=0 --call-rate=0 --num-calls=2000000 --conn-rate=0 --num-conns=1 --sizes=d5120 --method=add" \
		"mcperf replace ./mcperf --linger=0 --call-rate=0 --num-calls=2000000 --conn-rate=0 --num-conns=1 --sizes=d5120 --method=replace" \
		"mcperf append ./mcperf --linger=0 --call-rate=0 --num-calls=2000000 --conn-rate=0 --num-conns=1 --sizes=d5120 --method=append" \
		"mcperf prepend ./mcperf --linger=0 --call-rate=0 --num-calls=2000000 --conn-rate=0 --num-conns=1 --sizes=d5120 --method=prepend" \
		"mkl-dnn conv_all ./benchdnn --mode=p --conv --batch=inputs/conv/conv_all" "mkl-dnn conv_googlenet_v3 ./benchdnn --mode=p --conv --batch=inputs/conv/conv_googlenet_v3" \
		"mkl-dnn conv_alexnet ./benchdnn --mode=p --conv --batch=inputs/conv/conv_alexnet" "mkl-dnn ip_1d ./benchdnn --mode=p --ip --batch=inputs/ip/ip_1d" \
		"mkl-dnn ip_all ./benchdnn --mode=p --ip --batch=inputs/ip/ip_all" "mkl-dnn rnn_training ./benchdnn --mode=p --rnn --batch=inputs/rnn/rnn_training" \
		"node-express-loadtest" "numenta-nab" "phpbench php phpbench.php -i 1000000" "primesieve 1e12 --quiet --time" "pymongo" \
		"rbenchmark" "redis get" "redis set" "redis lpush" "redis lpop" "redis sadd" "rust-prime 200000000 8" "scikit" "sockperf under-load --mps=max -m 64 -t 30" \
		"sockperf ping-pong --mps=max -m 64 -t 30" "sockperf throughput --mps=max -m 64 -t 30" "stress-ng --vecmath 0 --vecmath-ops 200000" \
		"stress-ng --matrix 0 --matrix-ops 400000" "stress-ng --fork 0 --fork-ops 1000000" "stress-ng --msg 0 --msg-ops 100000000" \
		"stress-ng --sem 0 --sem-ops 20000000" "stress-ng --sock 0 --sock-ops 100000" "stress-ng --switch 0 --switch-ops 40000000" \
		"stream" "swet -Z" "t-test1 5000" "tensorflow" "tinymembench" "ttsiod-renderer" "xsbench -t 8 -s large -l 30000000" \
		"ramspeed copy_int" "ramspeed scale_int" "ramspeed add_int" "ramspeed triad_int" "ramspeed copy_float" "ramspeed scale_float" \
		"ramspeed add_float" "ramspeed traid_float" "botan AES-256" "botan Blowfish" "botan CAST-256" "botan KASUMI" "botan Twofish" "build-gcc" \
		"openarenaG 800x600" "openarenaG 1024x768" "openarenaG 1920x1080" "openarenaG 2560x1440" \
		"urbanterrorG 800x600" "urbanterrorG 1024x768" "urbanterrorG 1920x1080" "urbanterrorG 2560x1440" \
		"qgears -image" "qgears -render" "qgears -gl" "qgears TEXT" "qgears GEARSFANCY" "qgears COMPO" "jxrend" "javascimark2" \
		"j2dbench" "sunflow" "sqlitebench" "iozone -s2096000" "iozone -s4096000" "iozone -s8126000" \
		"dbench 1" "dbench 6" "dbench 12" "dbench 48" "dbench 128" "dbench 256" ) 
# timeConsumingTaks=( )
tasks=( "dbench 1" "dbench 6" "dbench 12" "dbench 48" "dbench 128" "dbench 256" "postmark ../inputs/postmark.pmrc" \
		"fs-mark 1000_Files_1MB_Size" "fs-mark 1000_Files_1MB_Size_No_Sync/FSync" "fs-mark 5000_Files_1MB_Size_4_Threads" \
		"fs-mark 4000_Files_32_Sub_Dirs_1MB_Size" "bork")

# Check array if more exist with the same name combine with last argument (testcase)
function startServers {
	case $1 in
		("apache")
			sudo /usr/local/apache2/bin/apachectl -k stop
			sudo rm -f /usr/local/apache2/logs/* 
			sudo /usr/local/apache2/bin/apachectl -k start
			sleep 10 ;;
		("nginx")
			sudo /usr/local/nginx/sbin/nginx -s stop
			sudo rm -f /usr/local/nginx/logs/* 
			sudo /usr/local/nginx/sbin/nginx
			sleep 10 ;;
		("mcperf")
			memcached &
			sleep 10 ;;
		("pymongo")
			sudo systemctl start mongod
			sleep 10 ;;
		("redis")
			sudo systemctl stop redis
			../${taskDirectory}/$1/src/redis-server &
			sleep 10 ;;
		("sockperf")
			sudo ../${taskDirectory}/$1/sockperf server &
			sleep 10 ;;
		(*) echo "No rule for $1" ;;
	esac
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
	|| [ -f ../${taskDirectory}/dcraw/*.ppm ] || [ -f bitmap0_* ] || [-f blog-* ] \
	|| [ -f alltext.out ] || [ -f output.ppm ] || [-f clover.* ] || [ -f results.txt ] ; then
		rm temp ; rm ao.ppm ; rm game.* ; rm log.* ; rm *.tmp
		rm ../inputs/tmp_linux-5.3.tar.gz.bz2 ; rm ../inputs/zstd_test.zst
		rm ../inputs/tmp_xz.txt.xz ; rm RES-multiply-* ; rm ../${taskDirectory}/dcraw/*.ppm 
		rm bitmap0_* ; rm -rf blog-* ; rm  alltext.out ; rm output.ppm; rm results.txt
		rm clover.* ; tmp_linux-5.3.tar.gz.bz2
	fi
}

# Note: for the above to work the alternative scenarios
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
		task=`echo $2 | sed 's/\-\-//g'`
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
		("apache" | "nginx" ) 
			startServers $task
			if [ $taskName == "apache" ]; then
				time (ab -n 1000000 -c 100 http://localhost:80/) 2> ../results/log_${taskName}.txt
				sudo /usr/local/apache2/bin/apachectl -k stop
			else
				time (ab -n 1000000 -c 100 http://0.0.0.0:80/) 2> ../results/log_${taskName}.txt
				sudo /usr/local/nginx/sbin/nginx -s stop
			fi
			getTimeInSeconds ../results/log_${taskName}.txt ;;
		("bzip2")
			cp ../inputs/linux-5.3.tar.gz ../inputs/tmp_linux-5.3.tar.gz
			time (../${taskDirectory}/${benchmark}/${task}) 2> ../results/log_${taskName}.txt ;;
		("xz")
			cp ../inputs/xz.txt ../inputs/tmp_xz.txt
			time (../${taskDirectory}/${benchmark}/${task}) 2> ../results/log_${taskName}.txt ;;
		("cloverleaf")
			cp ../inputs/clover.in ./
			time (../${taskDirectory}/${benchmark}/${task}) 2> ../results/log_${taskName}.txt ;;
		("hpcg")
			cp ../inputs/hpcg.dat ../${taskDirectory}/hpcg/
			cd ../${taskDirectory}/${benchmark}
			time (./${task}) 2> ../../../results/log_${taskName}.txt
			cd ../../scripts ;;
		("povray")
			time (../${taskDirectory}/${benchmark}/${task} <<< 1) 2> ../results/log_${taskName}.txt ;;
		glibc-bench* | dacapo* | cpp-perf-bench* | rodinia* | byte* | hint* | john-the-ripper* | gobench* | mcperf* | \
		mkl-dnn* | node-express-loadtest | numenta-nab | sudokut.sh | brlcad | gmpbench | lammps | phpbench | pymongo | \
		rbenchmark | redis* | scikit | tensorflow | ramspeed* | ttsiod-renderer | botan* | gnupg | aircrack-ng | sudokut | nero2d | \
		build-linux-kernel | build-gcc | build-llvm | openarena* | urbanterrorG* | j2dbench* | javascimark2 | sunflow | \
		sqlitebench | dbench* | fs-mark* | bork)
			if [ $benchmark == "mcperf" ] || [ $benchmark == "pymongo" ]  || [ $benchmark == "redis" ] ; then
				startServers $benchmark
			fi

			cd ../${taskDirectory}/${benchmark}
			time (./${task}) 2> ../../../results/log_${taskName}.txt
			cd ../../../scripts ;;
		("sockperf")
			startServers $benchmark
			time (../${taskDirectory}/${benchmark}/${task}) 2> ../results/log_${taskName}.txt
			pkill sockperf ;;
		(*) time (../${taskDirectory}/${benchmark}/${task}) 2> ../results/log_${taskName}.txt ;;
	esac

	getTimeInSeconds ../results/log_${taskName}.txt
	echo "${taskName}		${totalTime}" >> ../results/time.txt
done

dumpGarbage
echo "Done with all"
exit
