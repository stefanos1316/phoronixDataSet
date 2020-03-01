#!/bin/bash

# Tasks location file from where you downloaded and installed executables
taskDirectory="tools/tasks_test"

taskss=("aio-stress -s 15g -r 64k -t 3 temp" "aircrack-ng" "aobench" "apache" "nginx" "crafty bench quit" "tscp" \
		"stockfish bench" "p7zip b" "bzip2" "zstd ../inputs/zstd_test" "xz ../inputs/tmp_xz.txt" "byte register" \
		"byte dhry2" "byte int" "byte float" "scimark2" "fhourstones" "gmpbench" "dcraw ../${taskDirectory}/dcraw/DSC_50*" \
		"sudokut" "nero2d" "minion ../inputs/minions.minion" "hmmer -E 0.1 ../inputs/Pfam_ls ../inputs/7LES_DROME" \
		"rodinia euler3d_cpu_double ../../../inputs/missile.domn.0.2M" "rodinia lavaMD -cores $(nproc --all) -boxes1d 48" \
		"rodinia sc_omp 10 30 512 65536 65536 2000 none output.txt $(nproc --all) && rm output.txt" "openssl speed rsa4096" \
		"sysbench cpu --cpu-max-prime=20000000 --threads=8 run" "sysbench memory --memory-total-size=100G --threads=8 run" \
		"blake2s 100" "blogbench read -d ./ -i 5" "blogbench write -d ./ -i 5" "x264" "x265"  "ctx_clock" \
		"c-ray -t $(nproc --all) -s 3840x2160 -r 16 -i ../inputs/sphfract -o output.ppm" "povray -benchmark" \
		"cachebench read -r -m 9" "cachebench write -w -m 9" "cachebench mixed -b -m 9" "cachebench memset -s -m 9" "cachebench memcpy -p -m 9" \
		"cloverleaf" "brlcad run -P $(nproc --all)" "cpp-perf-bench stepanov_abstraction" "cpp-perf-bench stepanov_vector" \
		"cpp-perf-bench functionobjects" "cpp-perf-bench atol" "cpp-perf-bench ctype" "cpp-perf-bench mathlib" "cpp-perf-bench random_numbers" \
		"dacapo eclipse" "dacapo h2" "dacapo jython" "dacapo tradebeans" "dacapo tradesoap" "ebizzy -S 30" "glibc-bench bench-ffsll" "glibc-bench bench-ffs" \
		"glibc-bench bench-pthread_once" "glibc-bench bench-tanh" "glibc-bench bench-sqrt" "glibc-bench bench-sin" "glibc-bench bench-cos" \
		"glibc-bench bench-asinh" "glibc-bench bench-atanh" "glibc-bench bench-sincos" "glibc-bench bench-sinh" "glibc-bench bench-modf" \
		"glibc-bench bench-exp" "glibc-bench bench-log2" "himeno XL" "hint float" "hint double" "hpcg" "build-linux-kernel"\
		"john-the-ripper bcrypt" "john-the-ripper md5crypt" "lzbench -ezstd ../inputs/linux-5.3.tar.gz" "lzbench -ebrotli ../inputs/linux-5.3.tar.gz" \
		"lzbench -elibdeflate ../inputs/linux-5.3.tar.gz" "lzbench -exz ../inputs/linux-5.3.tar.gz" "m-queens 2 18" \
		"mbw 512 MiB -n 100 -t2" "mbw 1024 MiB -n 100 -t2" "mbw 4096 MiB -n 100 -t2" "mbw 8192 MiB -n 100 -t2" \
		"mcperf get" "mcperf set" "mcperf delete" "mcperf add" "mcperf replace" "mcperf append" "mcperf prepend" \
		"mkl-dnn conv_all conv" "mkl-dnn conv_googlenet_v3 conv" "mkl-dnn conv_alexnet conv" "mkl-dnn ip_1d ip" "mkl-dnn ip_all ip" "mkl-dnn rnn_training rnn" \
		"node-express-loadtest" "numenta-nab" "phpbench php phpbench.php -i 1000000" "primesieve 1e12 --quiet --time" "pymongo" \
		"rbenchmark" "redis get" "redis set" "redis lpush" "redis lpop" "redis sadd" "rust-prime 200000000 8" "scikit" "sockperf under-load --mps=max -m 64 -t 30" \
		"sockperf ping-pong --mps=max -m 64 -t 30" "sockperf throughput --mps=max -m 64 -t 30" "stress-ng --vecmath 0 --vecmath-ops 200000" \
		"stress-ng --matrix 0 --matrix-ops 400000" "stress-ng --fork 0 --fork-ops 1000000" "stress-ng --msg 0 --msg-ops 100000000" \
		"stress-ng --sem 0 --sem-ops 100000000" "stress-ng --sock 0 --sock-ops 100000" "stress-ng --switch 0 --switch-ops 40000000" \
		"stream" "swet -Z" "t-test1 5000" "tensorflow" "tinymembench" "ttsiod-renderer" "xsbench -t 8 -s large -l 30000000" \
		"ramspeed copy_int" "ramspeed scale_int" "ramspeed add_int" "ramspeed triad_int" "ramspeed copy_float" "ramspeed scale_float" \
		"ramspeed add_float" "ramspeed traid_float" "botan AES-256" "botan Blowfish" "botan CAST-256" "botan KASUMI" "botan Twofish" "build-gcc" \
		"openarenaG 800x600" "openarenaG 1024x768" "openarenaG 1920x1080" "openarenaG 2560x1440" \
		"urbanterrorG 800x600" "urbanterrorG 1024x768" "urbanterrorG 1920x1080" "urbanterrorG 2560x1440" \
		"qgears -image" "qgears -render" "qgears -gl" "qgears TEXT" "qgears GEARSFANCY" "qgears COMPO" "jxrend" "javascimark2" \
		"j2dbench" "sunflow" "sqlitebench" "iozone -s2096000" "iozone -s4096000" "iozone -s8126000" \
		"dbench 1" "dbench 6" "dbench 12" "dbench 48" "dbench 128" "dbench 256" "postmark ../inputs/postmark.pmrc" \
		"fs-mark 1000_Files_1MB_Size" "fs-mark 5000_Files_1MB_Size_4_Threads" "fs-mark 4000_Files_32_Sub_Dirs_1MB_Size" "bork" "ffmpeg" "encode-mp3" \
		"graphics-magick minify" "graphics-magick gaussian 0x1" "graphics-magick sharpen 0x2.0" "graphics-magick rotate 90" "graphics-magick resize 50%" \
		"rocksdb fillseq" "rocksdb fillrandom" "rocksdb readrandom" \
		"cassandra write" "cassandra read" "cassandra mixed_1_1" "cassandra mixed_1_3" \
		"xonotic 800x600" "xonotic 1024x768" "xonotic 1920x1080" "xonotic 2560x1440" "paraview manyspheres" "paraview waveletcontour" "paraview waveletvolume" \
		"glmark2 800x600" "glmark2 1024x768" "glmark2 1920x1080" "glmark2 2560x1440"  "compilebench initial_create" "compilebench compile" \
		"compilebench read_compile_tree" "smallpt 128" "build-php" "nexuiz 800x600" "nexuiz 1024x768" "nexuiz 1920x1080" "nexuiz 2560x1440" \
		"warsow 800x600" "warsow 1024x768" "warsow 1920x1080" "warsow 2560x1440" "inkscape" "rawtherapee" "tjbench" \
		"darktable masskrug.NEF" "darktable bench.SRW" "darktable server_room.NEF" "rsvg" "gegl rotate-on-center degrees=90" "gegl scale-size x=400 y=400" \
		"gegl antialias" "gegl cartoon" "gegl color-enhance" "gegl crop x=100 y=100 width=1920 height=1080" "gegl wavelet-blur" "gegl reflect" \
		"gegl tile-glass tile-width=20 tile-height=20" "renaissance akka-uct" "renaissance reactors" "renaissance als" "renaissance naive-bayes" \
		"renaissance page-rank" "renaissance db-shootout" "renaissance dotty" "renaissance finagle-chirper" "java-jmh" "schbench 2" "schbench 4" "schbench 8" \
		"osbench create_files" "osbench create_processes" "osbench create_threads" "osbench launch_programs" "osbench mem_alloc" \
		"tiobench write" "tiobench read" "tiobench random_write" "tiobench random_read" "pybench" "network-loopback" \
		"svt-vp9 tune_0" "svt-vp9 tune_1" "svt-vp9 tune_2" "svt-hevc" "tungsten hair" "tungsten water-caustic" "tungsten non-exponential" \
		"tungsten volumetric-caustic" "ospray san_miguel" "ospray nasa_streamlines" "ospray xfrog_forest" "ospray magnetic_reconnection" \
		"embree crown" "embree asian_dragon" "embree asian_dragon_obj" "iperf tcp" "iperf udp" "oidn" \
		"pyperformance-run 2to3" "pyperformance-run chaos" "pyperformance-run crypto_pyaes" "pyperformance-run django_template" \
		"pyperformance-run float" "pyperformance-run go" "pyperformance-run json_loads" "pyperformance-run nbody" "pyperformance-run pathlib" \
		"pyperformance-run pickle_pure_python" "pyperformance-run python_startup" "pyperformance-run raytrace" "pyperformance-run regex_compile" \
		"indigobench supercar" "indigobench bedroom" "rays1bench" "cp2k" "svt-av1" "dav1d summer_nature_1080p.ivf" "dav1d summer_nature_4k.ivf" \
		"dav1d chimera_8b_1080p.ivf" "dav1d chimera_10b_1080p.ivf" "cpuminer-opt lbry" "cpuminer-opt sha256t" "cpuminer-opt skein" \
		"cpuminer-opt myr-gr" "cpuminer-opt m7m" "cpuminer-opt deep" "vpxenc" "mt-dgemm" "deepspeech" "octave-benchmark" \
		"unigine-valley 800x600" "unigine-valley 1024x768" "unigine-valley 1920x1080" "unigine-valley 2560x1440" \
		"unigine-heaven 800x600" "unigine-heaven 1024x768" "unigine-heaven 1920x1080" "unigine-heaven 2560x1440" \
		"unigine-super 800x600" "unigine-super 1024x768" "unigine-super 1920x1080" "unigine-super 2560x1440" \
		"build-llvm" "build2" "build-gdb" "encode-flac")

tasks=( "scikit")

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
			sudo /etc/init.d/mongodb start
			sleep 10 ;;
		("redis")
			sudo systemctl stop redis
			../${taskDirectory}/$1/src/redis-server &
			sleep 10 ;;
		(*) echo "No rule for $1" ;;
	esac
}

function getTimeInSeconds {
	local filePath=$1
	local minutes=`grep real ${filePath} | tail -1 | awk {'print $2'} | awk -F'm' '{print $1}'`
	local seconds=`grep real ${filePath} | tail -1 | awk {'print $2'} | awk -F'm' '{print $2}' | sed 's/,/\./g' | awk -F'.' '{print $1}'`
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
	|| [ -f alltext.out ] || [ -f output.ppm ] || [-f clover.* ] || [ -f results.txt ] \
	|| [ -f image.ppm]; then
		rm temp ; rm ao.ppm ; rm game.* ; rm log.* ; rm *.tmp
		rm ../inputs/tmp_linux-5.3.tar.gz.bz2 ; rm ../inputs/zstd_test.zst
		rm ../inputs/tmp_xz.txt.xz ; rm RES-multiply-* ; rm ../${taskDirectory}/dcraw/*.ppm 
		rm bitmap0_* ; rm -rf blog-* ; rm alltext.out ; rm output.ppm; rm results.txt
		rm clover.* ; rm tmp_linux-5.3.tar.gz.bz2; rm image.ppm
	fi
}

# Note: for the above to work the alternative scenarios
# of the bench suite must be immediatly after the bench's name
function checkIfSubstringExistsMoreTimesInArray {
	local substring=$1
	local count=0
	local task
	for i in "${tasks[@]}"; do
		if [[ "$i" == "$substring"* ]]; then
			count=$((count+1))
		fi
	done

	if [  $count -gt 1 ]; then
		task=`echo $2 | sed 's/\-\-//g'`
		taskName=`echo ${taskName}_${task}`
	fi
}

function useWattsUpPro {
	local taskname=$2
	local dataPath="../results/tmp_energy_${taskname}.txt"
	case "$1" in
		("start")
			sudo ../tools/watts-up/wattsup ttyUSB0 -s watts >> ${dataPath}  &
			sleep 2 ;; 
		("stop")
			sudo pkill wattsup
			awk '{sum+=$1} END {print sum}' $dataPath >> ../results/energy.txt
			sleep 10 ;;
	esac
}

sudo bash ../tools/governor.sh pe

for task in "${tasks[@]}"; do

	taskName=`echo ${task} | awk '{print $1}'`
	benchmark=${taskName}
	checkIfSubstringExistsMoreTimesInArray ${task}
	totalTime=0
	useWattsUpPro start ${taskName}

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
		glibc-bench* | dacapo* | cpp-perf-bench* | rodinia* | byte* | hint* | john-the-ripper* | gobench* | mcperf* | \
		mkl-dnn* | node-express-loadtest | numenta-nab | sudokut.sh | brlcad | gmpbench  | phpbench | pymongo | \
		rbenchmark | redis* | scikit | tensorflow | ramspeed* | ttsiod-renderer | botan* | gnupg | aircrack-ng | sudokut | nero2d | \
		build-linux-kernel | build-gcc | build-llvm | openarena* | urbanterrorG* | j2dbench* | javascimark2 | sunflow | \
		sqlitebench | dbench* | fs-mark* | bork | ffmpeg | encode-mp3 | graphics-magick* | rocksdb* | cassandra* | \
		paraview* | xonotic* | compilebench* | build-php | nexuiz* | warsow* | inkscape | rawtherapee | tjbench | darktable* | \
		rsvg | gegl* | renaissance* | java-jmh | schbench* | osbench* | tiobench* | pybench | network-loopback | svt-vp9* | \
		svt-hevc | tungsten* | ospray* | embree* | iperf* | oidn | pyperformance-run* | indigobench* | rays1bench | \
		cp2k | svt-av1 | dav1d* | cpuminer-opt* | vpxenc | mt-dgemm | deepspeech | octave-benchmark | unigine-valley* | \
		unigine-heaven* | unigine-super* | build2 | build-gdb | aircrack-ng |  stockfish | x264 | x265 | ctx_clock | hmmer | cloverleaf | \
		encode-flac | xz | povray | bzip2 | hpcg | sockperf* )
			if [ $benchmark == "mcperf" ] || [ $benchmark == "pymongo" ]  || [ $benchmark == "redis" ] || \
				[ $benchmark == "cassandra" ] ; then
				startServers $benchmark
			fi

			cd ../${taskDirectory}/${benchmark}
			time (./${task}) 2> ../../../results/log_${taskName}.txt
			cd ../../../scripts ;;
		(*) time (../${taskDirectory}/${benchmark}/${task}) 2> ../results/log_${taskName}.txt ;;
	esac

	useWattsUpPro stop ${taskName}
	getTimeInSeconds ../results/log_${taskName}.txt
	echo "${taskName}		${totalTime}" >> ../results/time.txt
done

dumpGarbage
echo "Done with all"
python3 sendNotification.py "Stock"
exit
