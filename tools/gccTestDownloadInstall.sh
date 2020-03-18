#!/bin/bash

SECURITY_FLAGS=''

if [ -z "$1" ]; then
    echo "Please provide any of the following CFLAGS as a string to prepare the executables:"
    echo "'-fno-stack-protector -z execstack -no-pie -fvtable-verify=none'"
    SECURITY_FLAGS=''
else
    SECURITY_FLAGS=$1
fi

taskDirectory='gcc_tasks_test'
taskScripts='scripts'
mkdir gcc_tasks_test
cd gcc_tasks_test

echo "-------Downloading and installing libvpx"
git clone https://github.com/webmproject/libvpx.git
mv libvpx vpxenc && cd vpxenc 
./configure --disable-install-docs --disable-vp8 --enable-shared --prefix=`pwd` \
--extra-cflags="${SECURITY_FLAGS}"
make -j $(nproc --all)
make install
echo "#!/bin/bash
cd bin
THREADCOUNT=\$((\$(nproc --all)>64?64:\$nproc --all))
LD_PRELOAD=../lib/libvpx.so  ./vpxenc --cpu-used=5 \
-o /dev/null ../../../../inputs/Bosphorus_1920x1080_120fps_420_8bit_YUV.y4m \
--passes=1 --end-usage=cq --cq-level=30 --width=1920 --height=1080" > vpxenc
chmod +x vpxenc
cd ../

echo "-------Downloading and installing cpuminer-opt"
mkdir cpuminer-opt && cd cpuminer-opt
wget http://www.phoronix-test-suite.com/benchmark-files/cpuminer-opt-3.8.8.1.zip 
unzip cpuminer-opt-3.8.8.1.zip && rm cpuminer-opt-3.8.8.1.zip
mv cpuminer-opt-3.8.8.1/* ./ && rm -rf cpuminer-opt-3.8.8.1
./autogen.sh 
CFLAGS="-O3 -march=native ${SECURITY_FLAGS}" ./configure --without-curl
make -j $(nproc --all)
echo "#!/bin/sh
./cpuminer --quiet --time-limit=30 --benchmark -a \$1" > cpuminer-opt
chmod +x cpuminer-opt
cd ../

echo "-------Downloading and installing iperf"
mkdir iperf && cd iperf
wget https://downloads.es.net/pub/iperf/iperf-3.7.tar.gz
tar -xzvf iperf-3.7.tar.gz && rm iperf-3.7.tar.gz
mv iperf-3.7/* ./ && rm -rf iperf-3.7
./configure --prefix=`pwd` CFLAGS="-O3 -march=native ${SECURITY_FLAGS}"
make -j $(nproc --all)
make install
echo "#!/bin/sh
cd bin
# start server if doing localhost testing
./iperf3 -s &
IPERF_SERVER_PID=\$!
sleep 3
case \$1 in
    (\"tcp\")
        protocol=\"\" ;;
    (\"udp\")
        protocol=\"--udp\" ;;
esac
./iperf3 \$protocol -b 1000m  -t 30 -c 127.0.0.1 
kill \$IPERF_SERVER_PID" > iperf
chmod +x iperf
cd ../

echo "-------Downloading and installing tungsten"
mkdir tungsten && cd tungsten
wget http://phoronix-test-suite.com/benchmark-files/tungsten-20190812.zip
unzip tungsten-20190812.zip && rm tungsten-20190812.zip
mv tungsten-master/* ./ && rm -rf tungsten-master
./setup_builds.sh
cd build/release
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O3/-O3\ '"$toReplace"'/g' CMakeCache.txt
fi
make -j $(nproc --all)
cd ../../
echo "#!/bin/bash
cd build/release
./tungsten -t \$(nproc --all) ../../data/example-scenes/\$1/scene.json" > tungsten
chmod +x tungsten
cd ../

echo "-------Downloading and installing tiobench"
mkdir tiobench && cd tiobench
wget http://phoronix-test-suite.com/benchmark-files/tiobench-20170504.tar.bz2
tar -xjvf tiobench-20170504.tar.bz2 && rm tiobench-20170504.tar.bz2
mv tiobench-20170504/* ./ && rm -rf tiobench-20170504
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O2/-O2\ '"$toReplace"'/g' Makefile
fi
make -j $(nproc --all)
echo "#!/bin/bash
case \$1 in
    (\"write\")
        configurations=\"-k3 -k2 -k1\" ;;
    (\"read\")
        configurations=\"-k3 -k1\" ;;
    (\"random_write\")
        configurations=\"-k3 -k2\" ;;
    (\"random_read\")
        configurations=\"-k2 -k1\" ;;
esac

for i in {1..10}; do
    ./tiotest \$configurations -f 256 -t \$(nproc --all)
done"> tiobench
chmod +x tiobench
cd ../

echo "-------Downloading and installing osbench"
git clone https://github.com/mbitsnbites/osbench.git
cd osbench
cp ../../$taskScripts/osbench_create_files.c src/create_files.c
cp ../../$taskScripts/osbench_create_processes.c src/create_processes.c
cp ../../$taskScripts/osbench_create_threads.c src/create_threads.c
cp ../../$taskScripts/osbench_launch_programs.c src/launch_programs.c
cp ../../$taskScripts/osbench_mem_alloc.c src/mem_alloc.c
mkdir out
cd out
meson --buildtype=release ../src
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O3/-O3\ '"$toReplace"'/g' build.ninja
fi
ninja
mkdir target
cd ../
echo "#!/bin/bash
cd out/
if [ \"\$1\" == \"create_files\" ]; then
    ./\$1 \`pwd\`
else
    ./\$1
fi" > osbench
chmod +x osbench
cd ../

echo "-------Downloading and installing schbench"
mkdir schbench && cd schbench
wget http://phoronix-test-suite.com/benchmark-files/schbench-20180206.zip
unzip schbench-20180206.zip && rm schbench-20180206.zip
mv schbench/* ./ && rm -rf schbench/ 
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O2/-O2\ '"$toReplace"'/g' Makefile
fi
make
mv schbench schbench-bin
echo "#!/bin/sh
./schbench-bin -m \$1 -t \$(nproc --all) " > schbench
chmod +x schbench
cd ../

echo "-------Downloading and installing tjbench"
mkdir tjbench && cd tjbench
wget http://ftp.osuosl.org/pub/blfs/conglomeration/libjpeg-turbo/libjpeg-turbo-2.0.2.tar.gz
tar -xzvf libjpeg-turbo-2.0.2.tar.gz && rm libjpeg-turbo-2.0.2.tar.gz
mv libjpeg-turbo-2.0.2/* ./ && rm -rf libjpeg-turbo-2.0.2
wget http://phoronix-test-suite.com/benchmark-files/jpeg-test-1.zip
unzip jpeg-test-1.zip && rm jpeg-test-1.zip
cp jpeg-test-1.JPG jpeg-test-2.JPG
cp jpeg-test-1.JPG jpeg-test-3.JPG
cp jpeg-test-1.JPG jpeg-test-4.JPG
mkdir build
cd build
CFLAGS="${SECURITY_FLAGS}"  cmake ..
make -j $(nproc --all)
cd ..
echo "#!/bin/sh
./build/tjbench jpeg-test-1.JPG -nowrite
./build/tjbench jpeg-test-2.JPG -nowrite
./build/tjbench jpeg-test-3.JPG -nowrite
./build/tjbench jpeg-test-4.JPG -nowrite" > tjbench
chmod +x tjbench
cd ../

echo "-------Downloading and installing smallpt"
mkdir smallpt && cd smallpt
wget http://www.phoronix-test-suite.com/benchmark-files/smallpt-1.tar.gz
tar -xzvf smallpt-1.tar.gz && rm smallpt-1.tar.gz
c++ -fopenmp -O3 ${SECURITY_FLAGS} smallpt.cpp -o smallpt
cd ../

echo "-------Downloading and installing rocksdb"
mkdir rocksdb && cd rocksdb
git clone https://github.com/facebook/rocksdb
mv rocksdb/* ./ && rm -rf rocksdb
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O2/-O2\ '"$toReplace"'/g' Makefile
fi
make db_bench  
echo "#!/bin/bash
if [ \"\$1\" == \"readrandom\" ]; then
	for i in {1..20}; do
		./db_bench --benchmarks=\"\$1\" -compression_type \"none\" --threads \$(nproc --all) --num 2000000
	done
else
./db_bench --benchmarks=\"\$1\" -compression_type \"none\" --threads \$(nproc --all) --num 2000000
fi" > rocksdb
chmod +x rocksdb
cd ../

echo "-------Downloading and installing graphics-magick"
mkdir graphics-magick && cd graphics-magick
wget ftp://ftp.graphicsmagick.org/pub/GraphicsMagick/1.3/GraphicsMagick-1.3.33.tar.bz2
tar -xjf GraphicsMagick-1.3.33.tar.bz2 && rm GraphicsMagick-1.3.33.tar.bz2
mv GraphicsMagick-1.3.33/* ./ && rm -rf GraphicsMagick-1.3.33/
CFLAGS="${SECURITY_FLAGS}" ./configure --without-perl --prefix=`pwd` --without-png
make -j $(nproc --all)
make install
wget http://phoronix-test-suite.com/benchmark-files/sample-photo-6000x4000-1.zip
unzip sample-photo-6000x4000-1.zip && rm -rf sample-photo-6000x4000-1.zip
./bin/gm convert sample-photo-6000x4000.JPG input.mpc
chown -R `whoami` ./  
echo "#!/bin/sh
./bin/gm benchmark -iterations 300 convert input.mpc -\$1 \$2 output.miff
output.miff" > graphics-magick
chmod +x graphics-magick
cd ../

echo "-------Downloading and installing ffmpeg"
mkdir ffmpeg && cd ffmpeg
wget http://ffmpeg.org/releases/ffmpeg-4.0.2.tar.bz2
tar -xjvf ffmpeg-4.0.2.tar.bz2 && rm ffmpeg-4.0.2.tar.bz2
mv ffmpeg-4.0.2/* ./ && rm -rf ffmpeg-4.0.2/
wget http://samples.ffmpeg.org/V-codecs/h264/HD2-h264.ts
./configure --disable-zlib --disable-doc --prefix=`pwd` --extra-cflags="${SECURITY_FLAGS}"
make -j $(nproc --all)
make install
echo "#!/bin/bash
bin/ffmpeg -i HD2-h264.ts -f rawvideo -threads \$(nproc --all) -y -target ntsc-dv /dev/null" > ffmpeg
chmod +x ffmpeg
cd ../

echo "-------Downloading and installing encode-mp3"
mkdir encode-mp3 && cd encode-mp3
wget http://ftp.osuosl.org/pub/blfs/conglomeration/lame/lame-3.100.tar.gz
tar -xzvf lame-3.100.tar.gz && rm lame-3.100.tar.gz
mv lame-3.100/* ./ && rm -rf lame-3.100/
autoconf
CFLAGS="${SECURITY_FLAGS}" ./configure --prefix=`pwd` --enable-expopt=full
make
make install
wget https://www.phoronix.net/downloads/phoronix-test-suite/benchmark-files/pts-trondheim-wav-3.tar.gz
tar -xzvf pts-trondheim-wav-3.tar.gz && rm pts-trondheim-wav-3.tar.gz
echo "#!/bin/bash
./bin/lame -h pts-trondheim-3.wav" > encode-mp3
chmod +x encode-mp3
cd ../

echo "-------Downloading and installing fs-mark"
mkdir fs-mark && cd fs-mark
wget http://www.phoronix-test-suite.com/benchmark-files/fs_mark-3.3.tar.gz
tar -xzvf fs_mark-3.3.tar.gz && rm fs_mark-3.3.tar.gz
mv fs_mark-3.3/* ./ && rm -rf fs_mark-3.3/
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O2/-O2\ '"$toReplace"'/g' Makefile
fi
make -j $(nproc --all)
echo "#!/bin/bash
case \$1 in
	(\"1000_Files_1MB_Size\")
		getConfigurations=\"-s 1048576 -n 1000\";;
	(\"1000_Files_1MB_Size_No_Sync_FSync\")
		getConfigurations=\"-s 1048576 -n 1000 -S 0\";;
	(\"5000_Files_1MB_Size_4_Threads\")
		getConfigurations=\"-s 1048576 -n 5000 -t 4\";;
	(\"4000_Files_32_Sub_Dirs_1MB_Size\")
		getConfigurations=\"-s 1048576 -n 4000 -D 32\";;
esac
./fs_mark -d ./scratch/ \$getConfigurations" > fs-mark
chmod +x fs-mark
mkdir scratch
cd ../

echo "-------Downloading and installing dbench"
mkdir dbench && cd dbench
wget http://samba.org/ftp/tridge/dbench/dbench-4.0.tar.gz
tar -xf dbench-4.0.tar.gz && rm dbench-4.0.tar.gz
mv dbench-4.0/* ./ && rm -rf dbench-4.0
./autogen.sh
CFLAGS="${SECURITY_FLAGS}" ./configure --prefix=`pwd`
make -j $(nproc --all)
make install
echo "#!/bin/bash
bin/dbench \$@ -c client.txt
numberOfProcesses=`ps -aux | grep \"dbench\" | wc -l`
if [ \$numberOfProcesses -gt 1 ]; then
    kill -9 `ps -aux | grep "dbench" | head -1 | awk '{print \$2}'`
fi" > dbench
chmod +x dbench
cd ../

echo "-------Downloading and installing postmark"
mkdir postmark && cd postmark
wget http://archive.debian.org/debian/pool/main/p/postmark/postmark_1.51.orig.tar.gz
tar -xzvf postmark_1.51.orig.tar.gz && rm postmark_1.51.orig.tar.gz
mv postmark-1.51/* ./ && rm -rf postmark-1.51
cc -O3 ${SECURITY_FLAGS} postmark-1.51.c -o postmark
cp ../../../inputs/postmark.pmrc ./
cd ../

echo "-------Downloading and installing iozone"
mkdir iozone && cd iozone
wget http://iozone.org/src/current/iozone3_465.tar
tar -xf iozone3_465.tar && rm iozone3_465.tar
mv iozone3_465/* ./ && rm -rf iozone3_465
cd src/current/
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O3/-O3\ '"$toReplace"'/g' makefile
fi
make linux
cp iozone ../../
cd ../../../

echo "-------Downloading and installing sqlitebench"
mkdir sqlitebench && cd sqlitebench
wget  http://sqlite.org/2019/sqlite-autoconf-3300100.tar.gz
tar -xzvf sqlite-autoconf-3300100.tar.gz && rm sqlite-autoconf-3300100.tar.gz
mv sqlite-autoconf-3300100/* ./ && rm -rf sqlite-autoconf-3300100/
wget http://www.phoronix-test-suite.com/benchmark-files/pts-sqlite-tests-1.tar.gz
tar -xzvf pts-sqlite-tests-1.tar.gz && rm pts-sqlite-tests-1.tar.gz
CFLAGS="${SECURITY_FLAGS}" ./configure --prefix=`pwd`
make -j $(nproc --all)
make install
echo "#!/bin/sh
rm benchmark.db
bin/sqlite3 benchmark.db  \"CREATE TABLE pts1 ('I' SMALLINT NOT NULL, 'DT' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 'F1' VARCHAR(4) NOT NULL, 'F2' VARCHAR(16) NOT NULL);\"
cat sqlite-2500-insertions.txt | bin/sqlite3 benchmark.db" > sqlitebench
chmod +x sqlitebench
cd ../

echo "-------Downloading and installing botan"
mkdir botan && cd botan
wget http://botan.randombit.net/releases/Botan-2.8.0.tgz
tar -xf Botan-2.8.0.tgz && rm Botan-2.8.0.tgz
mv Botan-2.8.0/* ./ && rm -rf Botan-2.8.0 
python3 ./configure.py
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O3/-O3\ '"$toReplace"'/g' Makefile
fi
make -j $(nproc --all)
mv botan botan_bin
echo "#!/bin/bash
./botan_bin speed \$1 --format=table --msec=10000" > botan
chmod +x botan
cd ../

echo "-------Downloading and installing ttsiod-renderer"
mkdir ttsiod-renderer && cd ttsiod-renderer
wget http://www.phoronix-test-suite.com/benchmark-files/renderer-2.3b.zip
unzip renderer-2.3b.zip && rm renderer-2.3b.zip
mv renderer-2.3b/* ./ && rm -rf renderer-2.3b/
CFLAGS="${SECURITY_FLAGS}" ./configure
make -j $(nproc --all)
echo "#!/bin/bash
cd 3D-Objects
OMP_NUM_THREADS=\$(nproc --all) SDL_VIDEODRIVER=dummy ../src/renderer -b -n 10000 statue.ply" > ttsiod-renderer
chmod +x ttsiod-renderer
cd ../

echo "-------Downloading and installing xsbench"
mkdir xsbench && cd xsbench
wget http://phoronix-test-suite.com/benchmark-files/XSBench-20170808.zip
unzip XSBench-20170808.zip && rm XSBench-20170808.zip
mv XSBench-master/* ./ && rm -rf XSBench-master/
cd src/
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O3/-O3\ '"$toReplace"'/g' Makefile
fi
make
cp XSBench ../xsbench
cd ../../

echo "-------Downloading and installing tinymembench"
mkdir tinymembench && cd tinymembench
wget http://phoronix-test-suite.com/benchmark-files/tinymembench-20180528.zip
unzip tinymembench-20180528.zip && rm tinymembench-20180528.zip
mv tinymembench-master/* ./ && rm -rf tinymembench-master
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O2/-O2\ '"$toReplace"'/g' Makefile
fi
make
cd ../

echo "-------Downloading and installing t-test1"
mkdir t-test1 && cd t-test1
wget http://phoronix-test-suite.com/benchmark-files/t-test1c-20171.zip
unzip t-test1c-20171.zip && rm t-test1c-20171.zip
cc -pthread -O3 ${SECURITY_FLAGS} -o t-test1 t-test1.c
cd ../

echo "-------Downloading and installing swet"
mkdir swet && cd swet
wget http://www.phoronix-test-suite.com/benchmark-files/swet-1.5.16-src.tar.gz
tar -xzvf swet-1.5.16-src.tar.gz && rm swet-1.5.16-src.tar.gz
mv swet1/* ./ && rm -rf swet1
CFLAGS="${SECURITY_FLAGS}" ./configure
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-Wall/-Wall\ '"$toReplace"'/g' Makefile
fi
make
cd ../

echo "-------Downloading and installing stress-ng"
mkdir stress-ng && cd stress-ng
wget http://www.phoronix-test-suite.com/benchmark-files/stress-ng-0.07.26.tar.gz
tar -xzvf stress-ng-0.07.26.tar.gz && rm stress-ng-0.07.26.tar.gz
mv stress-ng-0.07.26/* ./ && rm -rf stress-ng-0.07.26/
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O2/-O2\ '"$toReplace"'/g' Makefile
fi
make -j $(nproc --all)
cd ../

echo "-------Downloading and installing stream"
mkdir stream && cd stream
wget http://www.phoronix-test-suite.com/benchmark-files/stream-2013-01-17.tar.bz2
tar -xjvf stream-2013-01-17.tar.bz2 && rm stream-2013-01-17.tar.bz2
cc stream.c -DSTREAM_ARRAY_SIZE=100000000 -DNTIMES=100 -O3 ${SECURITY_FLAGS} -fopenmp -o stream
cd ../

echo "-------Downloading and installing redis"
mkdir redis && cd redis
wget http://download.redis.io/releases/redis-5.0.5.tar.gz
tar -xzvf redis-5.0.5.tar.gz && rm redis-5.0.5.tar.gz
mv redis-5.0.5/* ./ && rm -rf redis-5.0.5/
cd deps/
make CFLAGS="${SECURITY_FLAGS}" hiredis jemalloc linenoise lua
cd ../
make CFLAGS="${SECURITY_FLAGS}" MALLOC=libc -j $(nproc --all)
echo "#!/bin/bash
running=`ps -aux | grep redis | wc -l`
if [ \$running -ne 2 ]; then
	src/redis-server &
fi
src/redis-benchmark -n 1000000 -P 640000 -q -c 50 --csv \$1" > redis
chmod +x redis 
cd ../

echo "-------Downloading and installing primesieve"
mkdir primesieve && cd primesieve
wget http://dl.bintray.com/kimwalisch/primesieve/primesieve-7.4.tar.gz
tar -xzvf primesieve-7.4.tar.gz && rm primesieve-7.4.tar.gz
mv primesieve-7.4/* ./ && rm -rf primesieve-7.4/
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/COMPILE_FLAGS/COMPILE_FLAGS\ '"$toReplace"'/g' CMakeLists.txt
fi
cmake . -DBUILD_SHARED_LIBS=OFF
make -j $(nproc --all)
cd ../

echo "-------Downloading and installing mkl-dnn"
mkdir mkl-dnn && cd mkl-dnn
wget https://github.com/intel/mkl-dnn/archive/v1.1.tar.gz
tar -xf v1.1.tar.gz && rm v1.1.tar.gz
mv mkl-dnn-1.1/* ./ && rm -rf mkl-dnn-1.1/
mkdir build && cd build
CFLAGS="-O3 -march=native ${SECURITY_FLAGS}" CXXFLAGS="-O3 -march=native ${SECURITY_FLAGS}" \
cmake -DCMAKE_BUILD_TYPE=Release MKLDNN_ARCH_OPT_FLAGS="-O3 -march=native ${SECURITY_FLAGS}" $CMAKE_OPTIONS ..
make -j $(nproc --all)
cd ../
echo "#!/bin/bash
cd build/tests/benchdnn
./benchdnn --mode=p --\$2 --batch=inputs/\$2/\$1" > mkl-dnn
chmod +x mkl-dnn
cd ../

echo "-------Downloading and installing mbw"
mkdir mbw && cd mbw
wget http://www.phoronix-test-suite.com/benchmark-files/mbw-20180908.tar.xz
tar -xf mbw-20180908.tar.xz && rm mbw-20180908.tar.xz
mv mbw/* ./ && rm -rf mbw
cc ${SECURITY_FLAGS} -O3 -march=native -o mbw mbw.c
cd ../

echo "-------Downloading and installing mcperf"
mkdir mcperf && cd mcperf
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/twemperf/mcperf-0.1.1.tar.gz
tar -xzvf mcperf-0.1.1.tar.gz && rm mcperf-0.1.1.tar.gz
mv mcperf-0.1.1/* ./ && rm -rf mcperf-0.1.1
CFLAGS="${SECURITY_FLAGS}" ./configure
make
echo "#!/bin/bash
cd src/
./mcperf --linger=0 --call-rate=0 --num-calls=2000000 --conn-rate=0 --num-conns=1 --sizes=d5120 --method=\$1" > mcperf
chmod +x mcperf
cd ../

echo "-------Downloading and installing lzbench"
mkdir lzbench && cd lzbench
wget http://www.phoronix-test-suite.com/benchmark-files/lzbench-20170808.zip
unzip lzbench-20170808.zip && rm lzbench-20170808.zip
mv lzbench/* ./ && rm -rf lzbench/
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O3/-O3\ '"$toReplace"'/g' Makefile
fi
make
mv lzbench lzbench-bin
cp ../../../inputs/linux-5.3.tar.gz ./
echo "#!/bin/bash
./lzbench-bin -t10,10 -v \$1 ./linux-5.3.tar.gz" > lzbench
chmod +x lzbench
cd ../

echo "-------Downloading and installing m-queens"
mkdir m-queens && cd m-queens
wget http://phoronix-test-suite.com/benchmark-files/m-queens-1.2.tar.gz
tar -xzvf m-queens-1.2.tar.gz && rm m-queens-1.2.tar.gz
mv m-queens-1.2/* ./ && rm -rf m-queens-1.2/
g++ -fopenmp $CFLAGS ${SECURITY_FLAGS} main.c -o m-queens
cd ../

echo "-------Downloading and installing john-the-ripper"
mkdir john-the-ripper && cd john-the-ripper
wget https://www.openwall.com/john/k/john-1.9.0-jumbo-1.tar.gz
tar -zxvf john-1.9.0-jumbo-1.tar.gz && rm john-1.9.0-jumbo-1.tar.gz
mv john-1.9.0-jumbo-1/* ./ && rm -rf john-1.9.0-jumbo-1
cd src/
CFLAGS="${SECURITY_FLAGS} -O3 -march=native -std=gnu89" ./configure --disable-native-tests --disable-opencl
CFLAGS="${SECURITY_FLAGS} -O3 -march=native -std=gnu89" make -j $(nproc --all)
cd ../
echo "#!/bin/bash
cd run/
./john --test=30 --format=\$1" > john-the-ripper
chmod +x john-the-ripper
cd ../

echo "-------Downloading and installing himeno"
mkdir himeno && cd himeno
wget http://www.phoronix-test-suite.com/benchmark-files/himenobmtxpa-2.tar.xz
tar -xf himenobmtxpa-2.tar.xz && rm himenobmtxpa-2.tar.xz
cc himenobmtxpa.c ${SECURITY_FLAGS} -O3 -mavx2 -o himeno
cd ../

echo "-------Downloading and installing hint"
mkdir hint && cd hint
wget http://www.phoronix-test-suite.com/benchmark-files/hint-1.0.tar.gz
tar -xzvf hint-1.0.tar.gz && rm hint-1.0.tar.gz
mv unix/* ./ && rm -rf unix
cc -O3 ${SECURITY_FLAGS} -march=native hint.c hkernel.c -Dunix -DDOUBLE -DIINT -o double -lm
cc -O3 ${SECURITY_FLAGS} -march=native hint.c hkernel.c -Dunix -DFLOAT -DIINT -o float -lm
echo "#!/bin/bash
./\$1" > hint
chmod +x hint
cd ../

echo "-------Downloading and installing ebizzy"
mkdir ebizzy && cd ebizzy
wget http://www.phoronix-test-suite.com/benchmark-files/ebizzy-0.3.tar.gz
tar -xzvf ebizzy-0.3.tar.gz && rm ebizzy-0.3.tar.gz
mv ebizzy-0.3/* ./ && rm -rf ebizzy-0.3
cc -pthread -lpthread -O3 ${SECURITY_FLAGS} -march=native -o ebizzy ebizzy.c
cd ../

echo "-------Downloading and installing cpp-perf-bench"
mkdir cpp-perf-bench && cd cpp-perf-bench
wget http://phoronix-test-suite.com/benchmark-files/CppPerformanceBenchmarks-9.zip
unzip CppPerformanceBenchmarks-9.zip && rm CppPerformanceBenchmarks-9.zip
mv CppPerformanceBenchmarks-master/* ./ && rm -rf CppPerformanceBenchmarks-master/
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O3/-O3\ '"$toReplace"'/g' makefile
fi
make all
echo "#!/bin/bash
./\$1" > cpp-perf-bench
chmod + cpp-perf-bench
cd ../

echo "-------Downloading and installing brlcad"
mkdir brlcad && cd brlcad
wget https://iweb.dl.sourceforge.net/project/brlcad/BRL-CAD%20Source/7.28.0/brlcad-7.28.0.tar.bz2
tar -xf brlcad-7.28.0.tar.bz2 && rm brlcad-7.28.0.tar.bz2
mv brlcad-7.28.0/* ./ && rm -rf brlcad-7.28.0/
mkdir build && cd build
whims=`echo ${SECURITY_FLAGS} | sed 's/\-z\ execstack//g'`
cmake .. -DBRLCAD_ENABLE_STRICT=NO -DBRLCAD_BUNDLED_LIBS=ON -DBRLCAD_OPTIMIZED_BUILD=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS="${SECURITY_FLAGS}"
make -j $(nproc --all)
cd ../
echo "#!/bin/bash
./build/bench/benchmark run -P 8" > brlcad
chmod +x brlcad
cd ../

echo "-------Downloading and installing cloverleaf"
mkdir cloverleaf && cd cloverleaf
wget http://phoronix-test-suite.com/benchmark-files/CloverLeaf_OpenMP-20181012.zip
unzip CloverLeaf_OpenMP-20181012.zip && rm CloverLeaf_OpenMP-20181012.zip
mv CloverLeaf_OpenMP-master/* ./ && rm -rf CloverLeaf_OpenMP-master/
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O3/-O3\ '"$toReplace"'/g' Makefile
fi
COMPILER=GNU make
cp InputDecks/clover_bm8192.in ../../../inputs
echo "#!/bin/bash
for i in {1..10}; do
    ./clover_leaf InputDecks/clover_bm8192.in
done" > cloverleaf
chmod +x cloverleaf
cd ../

echo "-------Downloading and installing c-ray"
mkdir c-ray && cd c-ray
wget http://www.phoronix-test-suite.com/benchmark-files/c-ray-1.1.tar.gz
tar -xzvf c-ray-1.1.tar.gz && rm c-ray-1.1.tar.gz
mv c-ray-1.1/* ./ && rm -rf c-ray-1.1/
cc -o c-ray-mt c-ray-mt.c -lm -lpthread -O3 ${SECURITY_FLAGS}
mv c-ray-mt c-ray
cd ../

echo "-------Downloading and installing blogbench"
mkdir blogbench && cd blogbench
wget http://download.pureftpd.org/pub/blogbench/blogbench-1.1.tar.gz
tar -xzvf blogbench-1.1.tar.gz && rm blogbench-1.1.tar.gz
mv blogbench-1.1/* ./ && rm -rf blogbench-1.1/
CFLAGS="${SECURITY_FLAGS}" ./configure
make -j $(nproc --all)
cp src/blogbench ./
cd ../

echo "-------Downloading and installing blake2s"
mkdir blake2s && cd blake2s
wget http://www.phoronix-test-suite.com/benchmark-files/BLAKE2-20170307.tar.xz
tar -xf BLAKE2-20170307.tar.xz && rm BLAKE2-20170307.tar.xz
mv BLAKE2-20170307/* ./ && rm -rf BLAKE2-20170307/
cp ../../$taskScripts/blake2s.c bench/bench.c
cd bench
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O3/-O3\ '"$toReplace"'/g' makefile
fi
make
cp blake2s ../
cd ../../

echo "-------Downloading and installing sysbench"
mkdir sysbench && cd sysbench
wget http://www.phoronix-test-suite.com/benchmark-files/sysbench-20180728.zip
unzip sysbench-20180728.zip && rm sysbench-20180728.zip
mv sysbench-master/* ./ && rm -rf sysbench-master/ 
./autogen.sh
CFLAGS="${SECURITY_FLAGS}" ./configure  --without-mysql
make -j $(nproc --all)
cp src/sysbench ./
cd ../

echo "-------Downloading and installing X265"
mkdir x265 && cd x265
wget http://bitbucket.org/multicoreware/x265/downloads/x265_3.1.2.tar.gz
tar -xzvf x265_3.1.2.tar.gz && rm x265_3.1.2.tar.gz
mv x265_3.1.2/* ./ && rm -rf x265_3.1.2/ && cd build
sed -i 's/CMAKE_C_FLAGS_RELEASE/CMAKE_C_FLAGS_RELEASE '"${SECURITY_FLAGS}"'/g' ../source/CMakeLists.txt
cmake ../source
make -j $(nproc --all)
cd ../
echo "#!/bin/bash
cd build
./x265 ../../../../inputs/Bosphorus_1920x1080_120fps_420_8bit_YUV.y4m  -o /dev/null" > x265
chmod +x x265
cd ../

echo "-------Downloading and installing openssl"
mkdir openssl && cd openssl
wget http://www.openssl.org/source/old/1.0.1/openssl-1.0.1g.tar.gz
tar -xzvf openssl-1.0.1g.tar.gz && rm openssl-1.0.1g.tar.gz
mv openssl-1.0.1g/* ./ && rm -rf openssl-1.0.1g/
whims=`echo ${SECURITY_FLAGS} | sed 's/\-z\ execstack//g'`
./config no-zlib ${whims}
make
cp apps/openssl ./
cd ../

echo "-------Downloading and installing X264"
mkdir x264 && cd x264
wget http://download.videolan.org/pub/videolan/x264/snapshots/x264-snapshot-20180925-2245.tar.bz2
tar -xjf x264-snapshot-20180925-2245.tar.bz2 && rm x264-snapshot-20180925-2245.tar.bz2
mv x264-snapshot-20180925-2245/* ./ && rm -rf x264-snapshot-20180925-2245/
CFLAGS="${SECURITY_FLAGS}" ./configure --prefix=./ --disable-opencl  --enable-pic --enable-shared
make install
echo "#!/bin/bash
cd bin
./x264 ../../../../inputs/Bosphorus_1920x1080_120fps_420_8bit_YUV.y4m  -o /dev/null" > x264
chmod +x x264
cd ../

echo "-------Downloading and installing hmmer"
mkdir hmmer && cd hmmer
wget http://www.phoronix-test-suite.com/benchmark-files/hmmer-2.3.2.tar.gz
tar -xzvf hmmer-2.3.2.tar.gz && rm hmmer-2.3.2.tar.gz
mv hmmer-2.3.2/* ./ && rm -rf hmmer-2.3.2/
CFLAGS="${SECURITY_FLAGS}" ./configure --enable-threads
make -j $(nproc --all)
echo "!#/bin/bash
cd src/
for i in {1..10}; do
./hmmpfam -E 0.1 ../../../..//inputs/Pfam_ls ../../../..//inputs/7LES_DROME
done" > hmmer
chmod +x hmmer
wget http://www.phoronix-test-suite.com/benchmark-files/Pfam_ls.gz
gunzip Pfam_ls.gz -c > ../../../inputs/Pfam_ls && rm Pfam_ls.gz 
cd ../

echo "-------Downloading and installing minion"
mkdir minion && cd minion
wget http://constraintmodelling.org/files/2015/06/minion-1.8-linux.tar_.gz
tar -xzvf minion-1.8-linux.tar_.gz && rm minion-1.8-linux.tar_.gz
mv minion-1.8/* ./ && rm -rf minion-1.8/
cd bin/
cmake -DQUICK=1 ..
make minion -j $(nproc --all)
cd ../ && rm -rf minion
cp bin/minion ./
cd ../

echo "-------Downloading and installing nero2d"
mkdir nero2d && cd nero2d
wget http://www.phoronix-test-suite.com/benchmark-files/nero2d-2.0.2-pts1.tar.gz
tar -xzvf nero2d-2.0.2-pts1.tar.gz && rm nero2d-2.0.2-pts1.tar.gz
mv nero2d-2.0.2/* ./ && rm -rf nero2d-2.0.2/
CFLAGS="${SECURITY_FLAGS}" ./configure
make -j $(nproc --all)
echo "#!/bin/bash
./src/nero2d ../../../inputs/nero2d.igf" > nero2d
chmod +x nero2d
cd ../

echo "-------Downloading and installing gmpbench"
mkdir gmpbench && cd gmpbench
wget ftp://ftp.gmplib.org/pub/misc/gmpbench-0.2.tar.bz2
tar -xjvf gmpbench-0.2.tar.bz2 && rm gmpbench-0.2.tar.bz2
mv gmpbench-0.2/* ./ && rm -rf gmpbench-0.2
wget http://www.phoronix.net/downloads/phoronix-test-suite/benchmark-files/gexpr.c.tar.gz
tar -xvzf gexpr.c.tar.gz && rm gexpr.c.tar.gz 
cc -O3 gexpr.c -o gexpr -lm ${SECURITY_FLAGS}
mv runbench ./gmpbench
cd ../

echo "-------Downloading and installing dcraw"
mkdir dcraw && cd dcraw
wget http://www.phoronix-test-suite.com/benchmark-files/dcraw-test-1.tar.bz2
tar -xjvf dcraw-test-1.tar.bz2 && rm dcraw-test-1.tar.bz2
cc -o dcraw -O3 dcraw.c -lm -DNO_JPEG -DNO_LCMS ${SECURITY_FLAGS}
cp DSC_5037.NEF DSC_5040.NEF
cp DSC_5037.NEF DSC_5041.NEF
cp DSC_5037.NEF DSC_5042.NEF
cp DSC_5037.NEF DSC_5043.NEF
cp DSC_5037.NEF DSC_5044.NEF
cp DSC_5037.NEF DSC_5045.NEF
cp DSC_5037.NEF DSC_5046.NEF
cp DSC_5037.NEF DSC_5047.NEF
cp DSC_5037.NEF DSC_5048.NEF
cp DSC_5037.NEF DSC_5049.NEF
cd ../

echo "-------Downloading and installing fhourstones"
mkdir fhourstones && cd fhourstones
wget http://www.phoronix-test-suite.com/benchmark-files/Fhourstones.tar.gz
tar -xzvf Fhourstones.tar.gz && rm Fhourstones.tar.gz 
cp ../../$taskScripts/SearchGame.c ./
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O3/-O3\ '"$toReplace"'/g' Makefile
fi
make -j $(nproc --all)
mv SearchGame fhourstones
cd ../

echo "-------Downloading and installing scimark2"
wget http://www.phoronix-test-suite.com/benchmark-files/scimark2_1c.zip
unzip scimark2_1c.zip -d scimark2 && rm scimark2_1c.zip && cd scimark2
cc -O3 -o scimark2 *.c -lm ${SECURITY_FLAGS}
cd ../

echo "-------Downloading and installing xz"
mkdir xz && cd xz
wget http://distfiles.macports.org/xz/xz-5.2.4.tar.bz2
tar -xvf xz-5.2.4.tar.bz2 && rm xz-5.2.4.tar.bz2
mv  xz-5.2.4/* ./ && rm -rf xz-5.2.4/
CFLAGS="${SECURITY_FLAGS}" ./configure
make -j $(nproc --all)
echo "#!/bin/bas
cp ../../../inputs/xz.txt tmp_xz.txt
if [ -f \"tmp_xz.txt.xz\" ]; then
	rm -f tmp_xz.txt.xz
fi
xz tmp_xz.txt" > xz
chmod +x xz
cd ../

echo "-------Downloading and installing BYTE"
mkdir byte && cd byte
wget http://www.phoronix-test-suite.com/benchmark-files/byte-benchmark-2.tar.gz
tar -zxvf byte-benchmark-2.tar.gz && rm byte-benchmark-2.tar.gz
mv  bm/* ./ && rm -rf bm/
make clean
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-DTIME/-DTIME\ '"$toReplace"'/g' Makefile
fi
make
mv Run byte
cd ../

echo "-------Downloading and installing p7zip"
mkdir p7zip && cd p7zip
wget http://ftp.osuosl.org/pub/blfs/conglomeration/p7zip/p7zip_16.02_src_all.tar.bz2
tar -xjvf p7zip_16.02_src_all.tar.bz2 && rm p7zip_16.02_src_all.tar.bz2
mv p7zip_16.02/* ./ && rm -rf p7zip_16.02
make -j $(nproc --all)
cp bin/7za ./p7zip
cd ../

echo "-------Downloading and installing zstd"
mkdir zstd && cd zstd
wget http://www.phoronix-test-suite.com/benchmark-files/zstd-1.3.4.tar.gz
tar -xvf zstd-1.3.4.tar.gz && rm zstd-1.3.4.tar.gz
mv  zstd-1.3.4/* ./ && rm -rf zstd-1.3.4/
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O3/-O3\ '"$toReplace"'/g' Makefile
fi
make -j $(nproc --all)
mv zstd zstd-bin
cp ../../../inputs/linux-5.3.tar.gz ./
echo "#!/bin/bash
./zstd-bin -19 -T\$(nproc --all) linux-5.3.tar.gz
rm -f linux-5.3.tar.gz.zst" > zstd
chmod +x zstd
cd ../

echo "-------Downloading and installing tscp"
mkdir tscp && cd tscp
wget http://www.phoronix-test-suite.com/benchmark-files/tscp181_pts.tar.bz2
tar -xjvf tscp181_pts.tar.bz2 && rm tscp181_pts.tar.bz2
mv tscp181/* ./ && rm -rf tscp181
cp ../../${taskScripts}/tscp_main.c ./main.c
cc -O3 ${SECURITY_FLAGS} *.c -o tscp
cd ../
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O3/-O3\ '"$toReplace"'/g' Makefile
fi
echo "-------Downloading and installing stockfish"
mkdir stockfish && cd stockfish
wget http://www.phoronix-test-suite.com/benchmark-files/stockfish-9-src.zip
unzip stockfish-9-src.zip && rm stockfish-9-src.zip
cd src
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-Wall/-Wall\ '"$toReplace"'/g' Makefile
fi
make build ARCH=x86-64-modern
cp stockfish ../stockfish-bin
cd ../
echo "#!/bin/bash
for i in {1..20}; do
	./stockfish-bin bench
done" > stockfish
chmod +x stockfish
cd ../

echo "-------Downloading and installing crafty"
mkdir crafty && cd crafty
wget http://craftychess.com/downloads/source/crafty-25.2.zip
unzip crafty-25.2.zip && rm crafty-25.2.zip
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O3/-O3\ '"$toReplace"'/g' Makefile
fi
make unix-gcc
cd ../

echo "-------Downloading and installing aobench"
mkdir aobench && cd aobench
wget http://phoronix-test-suite.com/benchmark-files/aobench-20180207.zip
unzip aobench-20180207.zip && rm aobench-20180207.zip
cc ${SECURITY_FLAGS} ao.c -o aobench -lm -O3
cd ../

echo "-------Downloading and installing ctx-clock"
mkdir ctx_clock && cd ctx_clock
cp ../../$taskScripts/ctx_clock.c ./ctx-clock.c
cc ${SECURITY_FLAGS} ctx-clock.c -o ctx-clock 
echo "#!/bin/bash
for i in {1..10}; do
    ./ctx-clock
done" > ctx_clock
chmod +x ctx_clock
cd ../

echo "-------Downloading and installing aircrack-ng"
mkdir aircrack-ng && cd aircrack-ng
wget https://download.aircrack-ng.org/aircrack-ng-1.3.tar.gz
tar -zxvf aircrack-ng-1.3.tar.gz && rm aircrack-ng-1.3.tar.gz
mv aircrack-ng-1.3/* ./
rm -rf aircrack-ng-1.3/
./autogen.sh
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-fstack-protector-strong/'"$toReplace"'/g' Makefile
fi
make -j $(nproc --all)
echo "#!/bin/bash
./src/aircrack-ng -w ../../../inputs/aircrack.txt ../../../inputs/wpa.cap" > aircrack-ng
chmod +x aircrack-ng
cd ../

echo "-------Downloading and installing bzip2"
mkdir bzip2 && cd bzip2
wget http://downloads.openwrt.org/sources/bzip2-1.0.6.tar.gz
tar -xzvf bzip2-1.0.6.tar.gz && rm bzip2-1.0.6.tar.gz
mv bzip2-1.0.6/* ./ && rm -rf bzip2-1.0.6
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O2/-O2\ '"$toReplace"'/g' Makefile
fi
make
mv bzip2 bzip2-bin
echo "#!/bin/bash
./bzip2-bin -c -5 ../../../inputs/linux-5.3.tar.gz > /dev/null" > bzip2 
chmod +x bzip2
cd ../

echo "-------Downloading and installing hpcg"
mkdir hpcg && cd hpcg
wget http://www.hpcg-benchmark.org/downloads/hpcg-3.1.tar.gz
tar -xzvf hpcg-3.1.tar.gz && rm hpcg-3.1.tar.gz
mv hpcg-3.1/* ./ && rm -rf hpcg-3.1
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/\$(LINKER)/\$(LINKER)\ '"$toReplace"'/g' Makefile
fi
make arch=Linux_MPI
echo "#!/bin/bash
rm -f HPCG-Benchmark*.txt
cd bin/
mpirun --allow-run-as-root -np 8 ./xhpcg" > hpcg
chmod +x hpcg
cd ../

echo "-------Downloading and installing povray"
mkdir povray && cd povray
wget http://www.phoronix-test-suite.com/benchmark-files/povray-3.7.0.7.tar.xz
tar -xf povray-3.7.0.7.tar.xz && rm povray-3.7.0.7.tar.xz
mv povray-3.7.0.7/* ./ && rm -rf povray-3.7.0.7/ 
cd unix
autoupdate
./prebuild.sh
cd ..
automake --add-missing
CXXFLAGS=${SECURITY_FLAGS} CFLAGS=${SECURITY_FLAGS} LIBS="-lboost_system" ./configure COMPILED_BY="justarandom@gmail.com" --with-boost-thread=boost_thread
make -j $(nproc --all)
echo "#!/bin/sh
echo 1 | ./unix/povray -benchmark" > povray
chmod +x povray
cd ../

echo "-------Downloading and installing ramspeed"
mkdir ramspeed && cd ramspeed
wget http://www.phoronix-test-suite.com/benchmark-files/ramsmp-3.5.0.tar.gz
tar -xzvf ramsmp-3.5.0.tar.gz && rm ramsmp-3.5.0.tar.gz
mv ramsmp-3.5.0/* ./ && rm -rf ramsmp-3.5.0
cc -O3 -march=native -o ramsmp fltmark.c fltmem.c intmark.c intmem.c ramsmp.c ${SECURITY_FLAGS}
echo "#!/bin/bash
argumentType=\`echo \$1 | awk -F\"_\" '{print \$2}'\`
testType=\`echo \$1 | awk -F\"_\" '{print \$1}'\`
case \${argumentType} in
	(\"int\") argumentType=3 ;;
	(\"float\") argumentType=6 ;;
esac
for i in {1..10}; do
	./ramsmp -b \${argumentType} -l \${testType} 
done" > ramspeed
chmod +x ramspeed
cd ../

echo "-------Downloading and installing mt-dgemm"
mkdir mt-dgemm && cd mt-dgemm
wget http://phoronix-test-suite.com/benchmark-files/mtdgemm-crossroads-v1.0.0.tgz
tar -xf mtdgemm-crossroads-v1.0.0.tgz && rm mtdgemm-crossroads-v1.0.0.tgz
mv mt-dgemm/* ./ && rm -rf mt-dgemm
cc -O3 -march=native -fopenmp -o mtdgemm src/mt-dgemm.c ${SECURITY_FLAGS} 
echo "#!/bin/sh
export OMP_NUM_THREADS=\$(nproc --all)
export OMP_PLACES=cores
export OMP_PROC_BIND=close
./mtdgemm 3072 4" > mt-dgemm
chmod +x mt-dgemm
cd ../

echo "-------Downloading and installing jxrend"
mkdir jxrend && cd jxrend
wget http://www.phoronix-test-suite.com/benchmark-files/JXRenderMark-1.0.1.zip
unzip JXRenderMark-1.0.1.zip && rm JXRenderMark-1.0.1.zip
cc JXRenderMark.c -o jxrend -lX11 -lXrender -O2 ${SECURITY_FLAGS}
cd ../

echo "-------Downloading and installing qgears"
mkdir qgears && cd qgears
wget http://www.phoronix-test-suite.com/benchmark-files/qgears2.tar.bz2
tar -jxf qgears2.tar.bz2 && rm qgears2.tar.bz2
mv qgears2/* ./ && rm -rf qgears2
chmod +w commonrenderer.cpp
echo "--- commonrenderer.cpp.orig       2008-11-02 16:19:16.000000000 -0500
+++ commonrenderer.cpp  2008-11-02 16:20:33.000000000 -0500
@@ -31,6 +31,7 @@
 double gear1_rotation = 35;
 double gear2_rotation = 24;
 double gear3_rotation = 33.5;
+int frame_report_count = 0;
 
 #define LINEWIDTH 3
 
@@ -83,7 +84,13 @@
 
     ++frame_cnt;
     if (FRAME_COUNT_INTERVAL == frame_cnt)
+    {
         printFrameRate();
+        frame_report_count++;
+    }
+
+    if(frame_report_count == 40)
+        exit(0);
 }
 
 QPainterPath CommonRenderer::gearPath(double inner_radius, double outer_radius," | patch -p0
qmake
if [ ! -z "$SECURITY_FLAGS" ]; then
    toReplace=`echo $SECURITY_FLAGS | sed  's/\ /\\\ /g'`
    sed -i 's/-O2/-O2\ '"$toReplace"'/g' Makefile
fi
make -j $(nproc --all)
mv qgears qgears-bin
echo "#!/bin/bash
export QT_QPA_PLATFORM='offscreen'
for i in {1..10}; do
./qgears-bin \$1
done" > qgears
chmod +x qgears
cd ../

echo "-------Downloading and installing aio-stress"
mkdir aio-stress && cd aio-stress
wget http://fsbench.filesystems.org/bench/aio-stress.c
cc -Wall -pthread -o aio-stress aio-stress.c -laio ${SECURITY_FLAGS}
cd ../