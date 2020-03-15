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