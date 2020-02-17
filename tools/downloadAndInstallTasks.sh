#!/bin/bash

taskDirectory='tasks_test'
taskScripts='scripts'
mkdir tasks_test 
cd tasks_test

# echo "-------Downloading and installing aio-stress"
# mkdir aio-stress
# cd aio-stress
# wget http://fsbench.filesystems.org/bench/aio-stress.c
# cc -Wall -pthread -o aio-stress aio-stress.c -laio
# cd ../

# echo "-------Downloading and installing aircrack-ng"
# mkdir aircrack-ng
# cd aircrack-ng
# wget https://download.aircrack-ng.org/aircrack-ng-1.3.tar.gz
# tar -zxvf aircrack-ng-1.3.tar.gz && rm aircrack-ng-1.3.tar.gz
# mv aircrack-ng-1.3/* ./
# rm -rf aircrack-ng-1.3/
# ./autogen.sh
# make -j $(nproc --all)
# cp ../${taskScripts}/aircrack-ng ./
# cd ../

# echo "-------Downloading and installing aobench"
# mkdir aobench && cd aobench
# wget http://phoronix-test-suite.com/benchmark-files/aobench-20180207.zip
# unzip aobench-20180207.zip && rm aobench-20180207.zip
# cc ao.c -o aobench -lm -O3
# cd ../

# echo "-------Downloading and installing apache"
# mkdir apache && cd apache
# wget http://archive.apache.org/dist/httpd/httpd-2.4.29.tar.bz2
# tar -xjvf httpd-2.4.29.tar.bz2 && rm httpd-2.4.29.tar.bz2
# mv httpd-2.4.29/* ./ && rm -rf httpd-2.4.29/
# ./configure
# make --j $(nproc --all)
# sudo make install
# cd ../

# echo "-------Downloading and installing nginx"
# mkdir nginx && cd nginx
# wget http://nginx.org/download/nginx-1.9.9.tar.gz
# tar -zxvf nginx-1.9.9.tar.gz && rm nginx-1.9.9.tar.gz
# mv nginx-1.9.9/* ./ && rm -rf nginx-1.9.9/
# ./configure
# sed -i 's/\-Werror//g' objs/Makefile
# make -j $(nproc --all)
# sudo make install
# cd ../

# echo "-------Downloading and installing crafty"
# mkdir crafty && cd crafty
# wget http://craftychess.com/downloads/source/crafty-25.2.zip
# unzip crafty-25.2.zip && rm crafty-25.2.zip
# make unix-gcc
# cd ../

# echo "-------Downloading and installing tscp"
# mkdir tscp && cd tscp
# wget http://www.phoronix-test-suite.com/benchmark-files/tscp181_pts.tar.bz2
# tar -xjvf tscp181_pts.tar.bz2 && rm tscp181_pts.tar.bz2
# mv tscp181/* ./ && rm -rf tscp181
# cp ../../${taskScripts}/tscp_main.c ./main.c
# cc -O3 *.c -o tscp
# cd ../

# echo "-------Downloading and installing stockfish"
# mkdir stockfish && cd stockfish
# wget http://www.phoronix-test-suite.com/benchmark-files/stockfish-9-src.zip
# unzip stockfish-9-src.zip && rm stockfish-9-src.zip
# cd src
# make build ARCH=x86-64-modern
# cp stockfish ../
# cd ../../

# echo "-------Downloading and installing p7zip"
# mkdir p7zip && cd p7zip
# wget http://ftp.osuosl.org/pub/blfs/conglomeration/p7zip/p7zip_16.02_src_all.tar.bz2
# tar -xjvf p7zip_16.02_src_all.tar.bz2 && rm p7zip_16.02_src_all.tar.bz2
# mv p7zip_16.02/* ./ && rm -rf p7zip_16.02
# make -j $(nproc --all)
# cp bin/7za ./p7zip
# cd ../

# echo "-------Downloading and installing bzip2"
# mkdir bzip2 && cd bzip2
# wget http://downloads.openwrt.org/sources/bzip2-1.0.6.tar.gz
# tar -xzvf bzip2-1.0.6.tar.gz && rm bzip2-1.0.6.tar.gz
# mv bzip2-1.0.6/* ./ && rm -rf bzip2-1.0.6
# make -j $(nproc --all)
# cd ../

# echo "-------Downloading and installing zstd"
# mkdir zstd && cd zstd
# wget http://www.phoronix-test-suite.com/benchmark-files/zstd-1.3.4.tar.gz
# tar -xvf zstd-1.3.4.tar.gz && rm zstd-1.3.4.tar.gz
# mv  zstd-1.3.4/* ./ && rm -rf zstd-1.3.4/
# make -j $(nproc --all)
# cd ../

# echo "-------Downloading and installing xd"
# mkdir xz && cd xz
# wget http://distfiles.macports.org/xz/xz-5.2.4.tar.bz2
# tar -xvf xz-5.2.4.tar.bz2 && rm xz-5.2.4.tar.bz2
# mv  xz-5.2.4/* ./ && rm -rf xz-5.2.4/
# ./configure
# make -j $(nproc --all)
# cp ../../$taskScripts/xz ./
# cd ../

# echo "-------Downloading and installing BYTE"
# mkdir byte && cd byte
# wget http://www.phoronix-test-suite.com/benchmark-files/byte-benchmark-2.tar.gz
# tar -zxvf byte-benchmark-2.tar.gz && rm byte-benchmark-2.tar.gz
# mv  bm/* ./ && rm -rf bm/
# make clean
# make
# mv Run byte
# cd ../

# echo "-------Downloading and installing scimark2"
# wget http://www.phoronix-test-suite.com/benchmark-files/scimark2_1c.zip
# unzip scimark2_1c.zip -d scimark2 && rm scimark2_1c.zip && cd scimark2
# cc -O3 -o scimark2 *.c -lm
# cd ../

# echo "-------Downloading and installing fhourstones"
# mkdir fhourstones && cd fhourstones
# wget http://www.phoronix-test-suite.com/benchmark-files/Fhourstones.tar.gz
# tar -xzvf Fhourstones.tar.gz && rm Fhourstones.tar.gz 
# cp ../../$taskScripts/SearchGame.c ./
# make -j $(nproc --all)
# mv SearchGame fhourstones
# cd ../

# echo "-------Downloading and installing gmpbench"
# mkdir gmpbench && cd gmpbench
# wget ftp://ftp.gmplib.org/pub/misc/gmpbench-0.2.tar.bz2
# tar -xjvf gmpbench-0.2.tar.bz2 && rm gmpbench-0.2.tar.bz2
# mv gmpbench-0.2/* ./ && rm -rf gmpbench-0.2
# wget http://www.phoronix.net/downloads/phoronix-test-suite/benchmark-files/gexpr.c.tar.gz
# tar -xvzf gexpr.c.tar.gz && rm gexpr.c.tar.gz 
# cc -O3 gexpr.c -o gexpr -lm
# mv runbench ./gmpbench
# cd ../

# echo "-------Downloading and installing dcraw"
# mkdir dcraw && cd dcraw
# wget http://www.phoronix-test-suite.com/benchmark-files/dcraw-test-1.tar.bz2
# tar -xjvf dcraw-test-1.tar.bz2 && rm dcraw-test-1.tar.bz2
# cc -o dcraw -O3 dcraw.c -lm -DNO_JPEG -DNO_LCMS
# cp DSC_5037.NEF DSC_5040.NEF
# cp DSC_5037.NEF DSC_5041.NEF
# cp DSC_5037.NEF DSC_5042.NEF
# cp DSC_5037.NEF DSC_5043.NEF
# cp DSC_5037.NEF DSC_5044.NEF
# cp DSC_5037.NEF DSC_5045.NEF
# cp DSC_5037.NEF DSC_5046.NEF
# cp DSC_5037.NEF DSC_5047.NEF
# cp DSC_5037.NEF DSC_5048.NEF
# cp DSC_5037.NEF DSC_5049.NEF
# cd ../

# echo "-------Downloading and installing sudokut"
# mkdir sudokut && cd sudokut
# wget http://www.phoronix-test-suite.com/benchmark-files/sudokut0.4-1.tar.bz2
# tar -xjvf sudokut0.4-1.tar.bz2 && rm sudokut0.4-1.tar.bz2
# mv sudokut0.4/* ./ && rm -rf sudokut0.4/
# mv sudokut sudokut-bin
# cp ../../$taskScripts/sudokut.sh ./
# sed -i 's/sudokut/sudokut\-bin/g' sudokut.sh
# mv sudokut.sh sudokut
# cd ../

# echo "-------Downloading and installing nero2d"
# mkdir nero2d && cd nero2d
# wget http://www.phoronix-test-suite.com/benchmark-files/nero2d-2.0.2-pts1.tar.gz
# tar -xzvf nero2d-2.0.2-pts1.tar.gz && rm nero2d-2.0.2-pts1.tar.gz
# mv nero2d-2.0.2/* ./ && rm -rf nero2d-2.0.2/
# ./configure
# make -j $(nproc --all)
# cp ../../$taskScripts/nero2d ./
# cd ../

# echo "-------Downloading and installing minion"
# mkdir minion && cd minion
# wget http://constraintmodelling.org/files/2015/06/minion-1.8-linux.tar_.gz
# tar -xzvf minion-1.8-linux.tar_.gz && rm minion-1.8-linux.tar_.gz
# mv minion-1.8/* ./ && rm -rf minion-1.8/
# cd bin/
# cmake -DQUICK=1 ..
# make minion -j $(nproc --all)
# cd ../ && rm -rf minion
# cp bin/minion ./
# cd ../

# echo "-------Downloading and installing hmmer"
# mkdir hmmer && cd hmmer
# wget http://www.phoronix-test-suite.com/benchmark-files/hmmer-2.3.2.tar.gz
# tar -xzvf hmmer-2.3.2.tar.gz && rm hmmer-2.3.2.tar.gz
# mv hmmer-2.3.2/* ./ && rm -rf hmmer-2.3.2/
# ./configure --enable-threads
# make -j $(nproc --all)
# cp src/hmmpfam ./hmmer
# wget http://www.phoronix-test-suite.com/benchmark-files/Pfam_ls.gz
# gunzip Pfam_ls.gz -c > ../../../inputs/Pfam_ls 
# cd ../

# echo "-------Downloading and installing rodinia"
# mkdir rodinia && cd rodinia
# wget http://www.cs.virginia.edu/~kw5na/lava/Rodinia/Packages/Current/rodinia_2.4.tar.bz2
# tar -xvf rodinia_2.4.tar.bz2 && rm rodinia_2.4.tar.bz2
# mv rodinia_2.4/* ./ && rm -rf rodinia_2.4/
# cp ../../$taskScripts/rodinia ./
# cp data/cfd/missile.domn.0.2M ../../../inputs/missile.domn.0.2M
# cd openmp/cfd && make && cp euler3d_cpu_double ../../ && cd ../
# cd lavaMD && make && cp lavaMD ../../ && cd ../
# cd streamcluster && make && cp sc_omp ../../
# cd ../../../

# echo "-------Downloading and installing openssl"
# mkdir openssl && cd openssl
# wget http://www.openssl.org/source/old/1.0.1/openssl-1.0.1g.tar.gz
# tar -xzvf openssl-1.0.1g.tar.gz && rm openssl-1.0.1g.tar.gz
# mv openssl-1.0.1g/* ./ && rm -rf openssl-1.0.1g/
# ./config no-zlib
# make
# cp apps/openssl ./
# cd ../

# echo "-------Downloading and installing X264"
# mkdir x264 && cd x264
# wget http://download.videolan.org/pub/videolan/x264/snapshots/x264-snapshot-20180925-2245.tar.bz2
# tar -xjf x264-snapshot-20180925-2245.tar.bz2 && rm x264-snapshot-20180925-2245.tar.bz2
# mv x264-snapshot-20180925-2245/* ./ && rm -rf x264-snapshot-20180925-2245/
# ./configure --prefix=./ --disable-opencl  --enable-pic --enable-shared
# make install
# cp bin/x264 ./
# cd ../

# echo "-------Downloading and installing X265"
# mkdir x265 && cd x265
# wget http://bitbucket.org/multicoreware/x265/downloads/x265_3.1.2.tar.gz
# tar -xzvf x265_3.1.2.tar.gz && rm x265_3.1.2.tar.gz
# mv x265_3.1.2/* ./ && rm -rf x265_3.1.2/ && cd build
# cmake ../source
# make -j $(nproc --all)
# cd ../
# cp build/x265 ./
# cd ../

# echo "-------Downloading and installing build-linux-kernel"
# mkdir build-linux-kernel && cd build-linux-kernel
# cp ../../../inputs/linux-5.3.tar.gz ./
# tar -xzvf linux-5.3.tar.gz && rm linux-5.3.tar.gz
# cp ../../$taskScripts/build-linux-kernel ./
# cd ../

# echo "-------Downloading and installing ctx-clock"
# mkdir ctx_clock && cd ctx_clock
# cp ../../$taskScripts/ctx_clock.c ./
# cc ctx_clock.c -o ctx_clock
# cd ../

# echo "-------Downloading and installing sysbench"
# mkdir sysbench && cd sysbench
# wget http://www.phoronix-test-suite.com/benchmark-files/sysbench-20180728.zip
# unzip sysbench-20180728.zip && rm sysbench-20180728.zip
# mv sysbench-master/* ./ && rm -rf sysbench-master/ 
# ./autogen.sh
# ./configure  --without-mysql
# make -j $(nproc --all)
# cp src/sysbench ./
# cd ../

# echo "-------Downloading and installing povray"
# mkdir povray && cd povray
# wget http://www.phoronix-test-suite.com/benchmark-files/povray-3.7.0.7.tar.xz
# tar -xf povray-3.7.0.7.tar.xz && rm povray-3.7.0.7.tar.xz
# mv povray-3.7.0.7/* ./ && rm -rf povray-3.7.0.7/ 
# cd unix
# autoupdate
# ./prebuild.sh
# cd ..
# automake --add-missing
# LIBS="-lboost_system" ./configure COMPILED_BY="justarandom@gmail.com" --with-boost-thread=boost_thread
# make -j $(nproc --all)
# cp unix/povray ./
# cd ../

# echo "-------Downloading and installing blake2s"
# mkdir blake2s && cd blake2s
# wget http://www.phoronix-test-suite.com/benchmark-files/BLAKE2-20170307.tar.xz
# tar -xf BLAKE2-20170307.tar.xz && rm BLAKE2-20170307.tar.xz
# mv BLAKE2-20170307/* ./ && rm -rf BLAKE2-20170307/
# cp ../../$taskScripts/blake2s.c bench/bench.c
# cd bench && make
# cp blake2s ../
# cd ../../

# echo "-------Downloading and installing c-ray"
# mkdir c-ray && cd c-ray
# wget http://www.phoronix-test-suite.com/benchmark-files/c-ray-1.1.tar.gz
# tar -xzvf c-ray-1.1.tar.gz && rm c-ray-1.1.tar.gz
# mv c-ray-1.1/* ./ && rm -rf c-ray-1.1/
# cc -o c-ray-mt c-ray-mt.c -lm -lpthread -O3
# mv c-ray-mt c-ray
# cd ../

# echo "-------Downloading and installing blogbench"
# mkdir blogbench && cd blogbench
# wget http://download.pureftpd.org/pub/blogbench/blogbench-1.1.tar.gz
# tar -xzvf blogbench-1.1.tar.gz && rm blogbench-1.1.tar.gz
# mv blogbench-1.1/* ./ && rm -rf blogbench-1.1/
# ./configure
# make -j $(nproc --all)
# cp src/blogbench ./
# cd ../

# echo "-------Downloading and installing cachebench"
# mkdir llbench && mkdir cachebench && cd llbench
# wget http://www.phoronix-test-suite.com/benchmark-files/llcbench-20170104.tar.gz
# tar -xzvf llcbench-20170104.tar.gz && rm llcbench-20170104.tar.gz
# mv llcbench/* ./ && rm -rf llcbench/
# cd cachebench
# sed -i '.orig' '/#include <malloc.h>/d' cachebench.c
# cp ../../../$taskScripts/cachebench.c ./
# cd ../
# make linux-mpich
# make cache-bench
# cp -r cachebench/* ../cachebench/
# cd ../
# rm -rf llbench

# echo "-------Downloading and installing cloverleaf"
# mkdir cloverleaf && cd cloverleaf
# wget http://phoronix-test-suite.com/benchmark-files/CloverLeaf_OpenMP-20181012.zip
# unzip CloverLeaf_OpenMP-20181012.zip && rm CloverLeaf_OpenMP-20181012.zip
# mv CloverLeaf_OpenMP-master/* ./ && rm -rf CloverLeaf_OpenMP-master/
# COMPILER=GNU make
# mv clover_leaf cloverleaf
# cp InputDecks/clover_bm8192.in ../../../inputs
# cp clover.in ../../../inputs
# cd ../

# echo "-------Downloading and installing brlcad"
# mkdir brlcad && cd brlcad
# wget https://iweb.dl.sourceforge.net/project/brlcad/BRL-CAD%20Source/7.28.0/brlcad-7.28.0.tar.bz2
# tar -xf brlcad-7.28.0.tar.bz2 && rm brlcad-7.28.0.tar.bz2
# mv brlcad-7.28.0/* ./ && rm -rf brlcad-7.28.0/
# mkdir build && cd build
# cmake .. -DBRLCAD_ENABLE_STRICT=NO -DBRLCAD_BUNDLED_LIBS=ON -DBRLCAD_OPTIMIZED_BUILD=ON -DCMAKE_BUILD_TYPE=Release
# make -j $(nproc --all)
# cd ../
# cp ../../$taskScripts/brlcad ./
# cd ../

# echo "-------Downloading and installing cpp-perf-bench"
# mkdir cpp-perf-bench && cd cpp-perf-bench
# wget http://phoronix-test-suite.com/benchmark-files/CppPerformanceBenchmarks-9.zip
# unzip CppPerformanceBenchmarks-9.zip && rm CppPerformanceBenchmarks-9.zip
# mv CppPerformanceBenchmarks-master/* ./ && rm -rf CppPerformanceBenchmarks-master/
# make all
# cp ../../$taskScripts/cpp-perf-bench ./
# cd ../

# echo "-------Downloading and installing dacapo"
# mkdir dacapo && cd dacapo
# wget 'https://downloads.sourceforge.net/project/dacapobench/9.12-bach-MR1/dacapo-9.12-MR1-bach.jar?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fdacapobench%2Ffiles%2F9.12-bach-MR1%2Fdacapo-9.12-MR1-bach.jar%2Fdownload%3Fuse_mirror%3Dautoselect&ts=1581797045'
# mv * dacapo.jar
# cp ../../$taskScripts/dacapo ./
# cd ../

# echo "-------Downloading and installing glibc-bench"
# mkdir glibc-bench && cd glibc-bench
# wget https://www.phoronix-test-suite.com/benchmark-files/glibc-benchmarks-2.tar.gz
# tar -xvf glibc-benchmarks-2.tar.gz && rm glibc-benchmarks-2.tar.gz
# mv glibc-benchmarks/* ./ && rm -rf glibc-benchmarks
# cp ../../$taskScripts/glibc-bench ./
# cd ../

# echo "-------Downloading and installing ebizzy"
# mkdir ebizzy && cd ebizzy
# wget http://www.phoronix-test-suite.com/benchmark-files/ebizzy-0.3.tar.gz
# tar -xzvf ebizzy-0.3.tar.gz && rm ebizzy-0.3.tar.gz
# mv ebizzy-0.3/* ./ && rm -rf ebizzy-0.3
# cc -pthread -lpthread -O3 -march=native -o ebizzy ebizzy.c
# cd ../

# echo "-------Downloading and installing himeno"
# mkdir himeno && cd himeno
# wget http://www.phoronix-test-suite.com/benchmark-files/himenobmtxpa-2.tar.xz
# tar -xf himenobmtxpa-2.tar.xz && rm himenobmtxpa-2.tar.xz
# cc himenobmtxpa.c -O3 -mavx2 -o himeno
# cd ../

# echo "-------Downloading and installing hint"
# mkdir hint && cd hint
# wget http://www.phoronix-test-suite.com/benchmark-files/hint-1.0.tar.gz
# tar -xzvf hint-1.0.tar.gz && rm hint-1.0.tar.gz
# mv unix/* ./ && rm -rf unix
# cc -O3 -march=native hint.c hkernel.c -Dunix -DDOUBLE -DIINT -o double -lm
# cc -O3 -march=native hint.c hkernel.c -Dunix -DFLOAT -DIINT -o float -lm
# cp ../../$taskScripts/hint ./
# cd ../

# echo "-------Downloading and installing hpcg"
# mkdir hpcg && cd hpcg
# wget http://www.hpcg-benchmark.org/downloads/hpcg-3.1.tar.gz
# tar -xzvf hpcg-3.1.tar.gz && rm hpcg-3.1.tar.gz
# mv hpcg-3.1/* ./ && rm -rf hpcg-3.1
# make arch=Linux_MPI
# cp ../../$taskScripts/hpcg ./
# cd ../

# echo "-------Downloading and installing john-the-ripper"
# mkdir john-the-ripper && cd john-the-ripper
# wget https://www.openwall.com/john/k/john-1.9.0-jumbo-1.tar.gz
# tar -zxvf john-1.9.0-jumbo-1.tar.gz && rm john-1.9.0-jumbo-1.tar.gz
# mv john-1.9.0-jumbo-1/* ./ && rm -rf john-1.9.0-jumbo-1
# cd src/
# CFLAGS="-O3 -march=native -std=gnu89" ./configure --disable-native-tests --disable-opencl
# CFLAGS="-O3 -march=native -std=gnu89" make -j $(nproc --all)
# cd ../
# cp ../../$taskScripts/john-the-ripper ./
# cd ../

# echo "-------Downloading and installing lammps"
# mkdir lammps && cd lammps
# wget https://github.com/lammps/lammps/archive/patch_9Jan2020.tar.gz
# tar -xzvf patch_9Jan2020.tar.gz && rm patch_9Jan2020.tar.gz
# mv lammps-patch_9Jan2020/* ./ && rm -rf lammps-patch_9Jan2020/
# mkdir b && cd b
# cmake ../cmake/ -DCMAKE_BUILD_TYPE=Release -DPKG_MOLECULE=1 -DPKG_KSPACE=1 -DPKG_RIGID=1 -DPKG_GRANULAR=1 -DPKG_MANYBODY=1
# make -j $(nproc --all)
# cd ../
# cp ../../$taskScripts/lammps ./
# cd ../

# echo "-------Downloading and installing lzbench"
# mkdir lzbench && cd lzbench
# wget http://www.phoronix-test-suite.com/benchmark-files/lzbench-20170808.zip
# unzip lzbench-20170808.zip && rm lzbench-20170808.zip
# mv lzbench/* ./ && rm -rf lzbench/
# make
# cd ../

# echo "-------Downloading and installing m-queens"
# mkdir m-queens && cd m-queens
# wget http://phoronix-test-suite.com/benchmark-files/m-queens-1.2.tar.gz
# tar -xzvf m-queens-1.2.tar.gz && rm m-queens-1.2.tar.gz
# mv m-queens-1.2/* ./ && rm -rf m-queens-1.2/
# g++ -fopenmp $CFLAGS main.c -o m-queens
# cd ../

# echo "-------Downloading and installing mbw"
# mkdir mbw && cd mbw
# wget http://www.phoronix-test-suite.com/benchmark-files/mbw-20180908.tar.xz
# tar -xf mbw-20180908.tar.xz && rm mbw-20180908.tar.xz
# mv mbw/* ./ && rm -rf mbw
# cc -O3 -march=native -o mbw mbw.c
# cd ../

# echo "-------Downloading and installing mcperf"
# mkdir mcperf && cd mcperf
# wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/twemperf/mcperf-0.1.1.tar.gz
# tar -xzvf mcperf-0.1.1.tar.gz && rm mcperf-0.1.1.tar.gz
# mv mcperf-0.1.1/* ./ && rm -rf mcperf-0.1.1
# ./configure
# make
# cp ../../$taskScripts/mcperf ./
# cd ../

# echo "-------Downloading and installing mkl-dnn"
# mkdir mkl-dnn && cd mkl-dnn
# wget https://github.com/intel/mkl-dnn/archive/v1.1.tar.gz
# tar -xf v1.1.tar.gz && rm v1.1.tar.gz
# mv mkl-dnn-1.1/* ./ && rm -rf mkl-dnn-1.1/
# mkdir build && cd build
# CFLAGS="-O3 -march=native" CXXFLAGS="-O3 -march=native" cmake -DCMAKE_BUILD_TYPE=Release MKLDNN_ARCH_OPT_FLAGS="-O3 -march=native" $CMAKE_OPTIONS ..
# make -j $(nproc --all)
# cd ../
# cp ../../$taskScripts/mkl-dnn ./
# cd ../

# echo "-------Downloading and installing node-express-loadtest"
# mkdir node-express-loadtest && cd node-express-loadtest
# wget http://phoronix-test-suite.com/benchmark-files/NodeRestPerfTest3-20181001.zip
# unzip NodeRestPerfTest3-20181001.zip && rm NodeRestPerfTest3-20181001.zip
# export TZ=EST
# mv NodeRestPerfTest3-master/* ./ && rm -rf NodeRestPerfTest3-master/
# npm i express
# npm i loadtest
# cp ../../$taskScripts/node-express-loadtest ./
# cd ../

# echo "-------Downloading and installing numenta-nab"
# mkdir numenta-nab && cd numenta-nab
# wget http://phoronix-test-suite.com/benchmark-files/NAB-20181109.tar.xz
# tar -xf NAB-20181109.tar.xz && rm NAB-20181109.tar.xz
# mv NAB-master/* ./ && rm -rf NAB-master/
# pip install . --user
# cp ../../$taskScripts/numenta-nab ./
# cd ../

# echo "-------Downloading and installing phpbench"
# mkdir phpbench && cd phpbench
# wget http://phoronix-test-suite.com/benchmark-files/phpbench-081-patched1.zip
# unzip phpbench-081-patched1.zip && rm phpbench-081-patched1.zip
# mv phpbench-0.8.1-patched1/* ./ && rm -rf phpbench-0.8.1-patched1/
# cp ../../$taskScripts/phpbench ./
# cd ../

# echo "-------Downloading and installing primesieve"
# mkdir primesieve && cd primesieve
# wget http://dl.bintray.com/kimwalisch/primesieve/primesieve-7.4.tar.gz
# tar -xzvf primesieve-7.4.tar.gz && rm primesieve-7.4.tar.gz
# mv primesieve-7.4/* ./ && rm -rf primesieve-7.4/
# cmake . -DBUILD_SHARED_LIBS=OFF
# make -j $(nproc --all)
# cd ../

# echo "-------Downloading and installing pymongo"
# mkdir pymongo && cd pymongo
# python3 -m pip install pymongo
# cp ../../$taskScripts/pymongo ./
# cp ../../$taskScripts/pymongoInsert.py ./
# cd ../

# echo "-------Downloading and installing rbenchmark"
# mkdir rbenchmark && cd rbenchmark
# wget http://www.phoronix-test-suite.com/benchmark-files/rbenchmarks-20160105.tar.bz2
# tar -xjvf rbenchmarks-20160105.tar.bz2 && rm rbenchmarks-20160105.tar.bz2
# mv rbenchmarks/* ./ && rm -rf rbenchmarks/
# cp ../../$taskScripts/rbenchmark ./
# cd ../

# echo "-------Downloading and installing redis"
# mkdir redis && cd redis
# wget http://download.redis.io/releases/redis-5.0.5.tar.gz
# tar -xzvf redis-5.0.5.tar.gz && rm redis-5.0.5.tar.gz
# mv redis-5.0.5/* ./ && rm -rf redis-5.0.5/
# cd deps/
# make hiredis jemalloc linenoise lua
# cd ../
# make MALLOC=libc -j $(nproc --all)
# cp ../../$taskScripts/redis ./
# cd ../

# echo "-------Downloading and installing rust-prime"
# mkdir rust-prime && cd rust-prime
# wget http://phoronix-test-suite.com/benchmark-files/Prime-Benchmark-20181001.zip
# unzip Prime-Benchmark-20181001.zip && rm Prime-Benchmark-20181001.zip
# mv Prime-Benchmark-master/* ./ && rm -rf Prime-Benchmark-master/
# RUSTFLAGS="-C target-cpu=native" rustc rust/main.rs -C opt-level=3 -o rust-prime
# cd ../

# echo "-------Downloading and installing scikit"
# mkdir scikit && cd scikit
# wget https://github.com/scikit-learn/scikit-learn/archive/0.22.1/scikit-learn-0.22.1.tar.gz
# tar -xzvf scikit-learn-0.22.1.tar.gz && rm scikit-learn-0.22.1.tar.gz
# mv scikit-learn-0.22.1/* ./ && rm -rf scikit-learn-0.22.1/
# cp ../../$taskScripts/scikit ./
# cd ../

# echo "-------Downloading and installing sockperf"
# mkdir sockperf && cd sockperf
# wget http://phoronix-test-suite.com/benchmark-files/sockperf-3.4.zip
# unzip sockperf-3.4.zip && rm sockperf-3.4.zip
# mv sockperf-3.4/* ./ && rm -rf sockperf-3.4/
# ./autogen.sh
# ./configure
# make -j $(nproc --all)
# cd ../

# echo "-------Downloading and installing stress-ng"
# mkdir stress-ng && cd stress-ng
# wget http://www.phoronix-test-suite.com/benchmark-files/stress-ng-0.07.26.tar.gz
# tar -xzvf stress-ng-0.07.26.tar.gz && rm stress-ng-0.07.26.tar.gz
# mv stress-ng-0.07.26/* ./ && rm -rf stress-ng-0.07.26/
# make -j $(nproc --all)
# cd ../

# echo "-------Downloading and installing stream"
# mkdir stream && cd stream
# wget http://www.phoronix-test-suite.com/benchmark-files/stream-2013-01-17.tar.bz2
# tar -xjvf stream-2013-01-17.tar.bz2 && rm stream-2013-01-17.tar.bz2
# cc stream.c -DSTREAM_ARRAY_SIZE=100000000 -DNTIMES=100 -O3 -fopenmp -o stream
# cd ../

# echo "-------Downloading and installing ramspeed"
# mkdir ramspeed && cd ramspeed
# wget http://www.phoronix-test-suite.com/benchmark-files/ramsmp-3.5.0.tar.gz
# tar -xzvf ramsmp-3.5.0.tar.gz && rm ramsmp-3.5.0.tar.gz
# mv ramsmp-3.5.0/* ./ && rm -rf ramsmp-3.5.0
# cc -O3 -march=native -o ramsmp fltmark.c fltmem.c intmark.c intmem.c ramsmp.c
# cp ../../$taskScripts/ramspeed ./
# cd ../

# echo "-------Downloading and installing swet"
# mkdir swet && cd swet
# wget http://www.phoronix-test-suite.com/benchmark-files/swet-1.5.16-src.tar.gz
# tar -xzvf swet-1.5.16-src.tar.gz && rm swet-1.5.16-src.tar.gz
# mv swet1/* ./ && rm -rf swet1
# ./configure
# make
# cd ../

# echo "-------Downloading and installing t-test1"
# mkdir t-test1 && cd t-test1
# wget http://phoronix-test-suite.com/benchmark-files/t-test1c-20171.zip
# unzip t-test1c-20171.zip && rm t-test1c-20171.zip
# cc -pthread -O3 -o t-test1 t-test1.c
# cd ../

# echo "-------Downloading and installing tensorflow"
# mkdir tensorflow && cd tensorflow
# wget http://www.phoronix-test-suite.com/benchmark-files/cifar10_tf.tar.gz
# tar -axf cifar10_tf.tar.gz && rm cifar10_tf.tar.gz
# mv cifar10/* ./ && rm -rf cifar10
# pip3 install tensorflow
# cp ../../$taskScripts/tensorflow ./
# cd ../

# echo "-------Downloading and installing tinymembench"
# mkdir tinymembench && cd tinymembench
# wget http://phoronix-test-suite.com/benchmark-files/tinymembench-20180528.zip
# unzip tinymembench-20180528.zip && rm tinymembench-20180528.zip
# mv tinymembench-master/* ./ && rm -rf tinymembench-master
# make
# cd ../

# echo "-------Downloading and installing xsbench"
# mkdir xsbench && cd xsbench
# wget http://phoronix-test-suite.com/benchmark-files/XSBench-20170808.zip
# unzip XSBench-20170808.zip && rm XSBench-20170808.zip
# mv XSBench-master/* ./ && rm -rf XSBench-master/
# cd src/ && make && cp XSBench ../xsbench
# cd ../../

# echo "-------Downloading and installing ttsiod-renderer"
# mkdir ttsiod-renderer && cd ttsiod-renderer
# wget http://www.phoronix-test-suite.com/benchmark-files/renderer-2.3b.zip
# unzip renderer-2.3b.zip && rm renderer-2.3b.zip
# mv renderer-2.3b/* ./ && rm -rf renderer-2.3b/
# ./configure
# make -j $(nproc --all)
# cp ../../${taskScripts}/ttsiod-renderer ./
# cd ../

# echo "-------Downloading and installing botan"
# mkdir botan && cd botan
# wget http://botan.randombit.net/releases/Botan-2.8.0.tgz
# tar -xf Botan-2.8.0.tgz && rm Botan-2.8.0.tgz
# mv Botan-2.8.0/* ./ && rm -rf Botan-2.8.0 
# python3 ./configure.py
# make -j $(nproc --all)
# mv botan botan_bin
# cp ../../${taskScripts}/botan ./
# cd ../

# echo "-------Downloading and installing build-gcc"
# mkdir build-gcc && cd build-gcc
# wget ftp://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-8.2.0/gcc-8.2.0.tar.gz
# tar -xzvf gcc-8.2.0.tar.gz && rm -rf 
# mv gcc-8.2.0/* ./ && rm -rf gcc-8.2.0
# cp ../../${taskScripts}/build-gcc ./
# cd ../

# echo "-------Downloading and installing build-llvm"
# mkdir build-llvm && cd build-llvm
# wget http://releases.llvm.org/6.0.1/llvm-6.0.1.src.tar.xz
# tar -xf llvm-6.0.1.src.tar.xz && rm llvm-6.0.1.src.tar.xz
# mv llvm-6.0.1.src/* ./ && rm -rf llvm-6.0.1.src/ 
# cp ../../${taskScripts}/build-llvm ./
# cd ../

# echo "-------Downloading and installing openarena"
# mkdir openarenaG && cd openarenaG
# wget http://iweb.dl.sourceforge.net/project/oarena/openarena-0.8.8.zip
# unzip openarena-0.8.8.zip && rm openarena-0.8.8.zip
# mv openarena-0.8.8/* ./ && rm -rf openarena-0.8.8 
# wget http://www.phoronix-test-suite.com/benchmark-files/openarena-088-1.zip
# unzip openarena-088-1.zip && rm openarena-088-1.zip
# mv pts-openarena-088.cfg baseoa/
# chmod +x openarena.x86_64
# cp ../../${taskScripts}/openarenaG ./
# cd ../

# echo "-------Downloading and installing urbanterror"
# mkdir urbanterrorG && cd urbanterrorG
# wget http://cdn.urbanterror.info/urt/43/releases/zips/UrbanTerror432_full.zip
# unzip UrbanTerror432_full.zip && rm UrbanTerror432_full.zip
# mv UrbanTerror43/* ./ && rm -rf UrbanTerror43/
# chmod +x Quake3-UrT.app/Contents/MacOS/Quake3-UrT.i386 
# wget http://www.phoronix-test-suite.com/benchmark-files/urbanterror-43-1.zip
# unzip urbanterror-43-1.zip && rm urbanterror-43-1.zip
# rm -f q3ut4/autoexec.cfg
# mv autoexec.cfg q3ut4/
# mkdir q3ut4/demos/
# mv pts-ut43.urtdemo q3ut4/demos/
# cp ../../${taskScripts}/urbanterrorG ./
# chmod +x Quake3-UrT.x86_64
# cd ../

# echo "-------Downloading and installing qgears"
# mkdir qgears && cd qgears
# wget http://www.phoronix-test-suite.com/benchmark-files/qgears2.tar.bz2
# tar -jxf qgears2.tar.bz2 && rm qgears2.tar.bz2
# mv qgears2/* ./ && rm -rf qgears2
# chmod +w commonrenderer.cpp
# echo "--- commonrenderer.cpp.orig	2008-11-02 16:19:16.000000000 -0500
# +++ commonrenderer.cpp	2008-11-02 16:20:33.000000000 -0500
# @@ -31,6 +31,7 @@
#  double gear1_rotation = 35;
#  double gear2_rotation = 24;
#  double gear3_rotation = 33.5;
# +int frame_report_count = 0;
 
#  #define LINEWIDTH 3
 
# @@ -83,7 +84,13 @@
 
#      ++frame_cnt;
#      if (FRAME_COUNT_INTERVAL == frame_cnt)
# +    {
#          printFrameRate();
# +        frame_report_count++;
# +    }
# +
# +    if(frame_report_count == 40)
# +        exit(0);
#  }
 
#  QPainterPath CommonRenderer::gearPath(double inner_radius, double outer_radius," | patch -p0
# qmake
# make -j $(nproc --all)
# cd ../

# echo "-------Downloading and installing jxrend"
# mkdir jxrend && cd jxrend
# wget http://www.phoronix-test-suite.com/benchmark-files/JXRenderMark-1.0.1.zip
# unzip JXRenderMark-1.0.1.zip && rm JXRenderMark-1.0.1.zip
# cc JXRenderMark.c -o jxrend -lX11 -lXrender -O3
# cd ../

# echo "-------Downloading and installing j2dbench"
# mkdir j2dbench && cd j2dbench
# wget http://www.phoronix-test-suite.com/benchmark-files/J2DBench.zip
# unzip J2DBench.zip && rm J2DBench.zip
# echo "#!/bin/sh
# rm -f *.output
# rm -f *.res
# case \"\$1\" in
# \"TEST_ALL\")
#   TEST_TYPE=all ;;
# \"TEST_GRAPHICS\")
#   TEST_TYPE=graphics ;;
# \"TEST_IMAGES\")
#   TEST_TYPE=images ;;
# \"TEST_TEXT\")
#   TEST_TYPE=text ;;
# esac
# java -Dsun.java2d.opengl=True -jar dist/J2DBench.jar \
# -batch -loadopts \$TEST_TYPE.opt -saveres \$TEST_TYPE.res \
# -title \$TEST_TYPE -desc \$TEST_TYPE > \$THIS_RUN_TIME.output
# java -jar dist/J2DAnalyzer.jar \$TEST_TYPE.res > \$LOG_FILE" > j2dbench
# chmod +x j2dbench
# cd ../

# echo "-------Downloading and installing javascimark2"
# mkdir javascimark2 && cd javascimark2
# wget http://math.nist.gov/scimark2/scimark2lib.zip
# unzip scimark2lib.zip && rm scimark2lib.zip
# echo "#!/bin/sh
# java jnt.scimark2.commandline
# echo \$? > ~/test-exit-status" > javascimark2
# chmod +x javascimark2
# cd ../

# echo "-------Downloading and installing sunflow"
# mkdir sunflow && cd sunflow
# wget  http://ufpr.dl.sourceforge.net/sourceforge/sunflow/sunflow-bin-v0.07.2.zip
# unzip sunflow-bin-v0.07.2.zip && rm sunflow-bin-v0.07.2.zip
# mv sunflow/* ./ && rm -rf sunflow
# echo "#!/bin/sh
# cd sunflow
# if [ \$SYS_MEMORY -ge 1280 ] ; then
# 	JAVA_VM_MEMORY=1024M
# elif [ \$SYS_MEMORY -ge 768 ] ; then
# 	JAVA_VM_MEMORY=512M
# else
# 	JAVA_VM_MEMORY=256M
# fi
# java -server -Xmx\$JAVA_VM_MEMORY -jar sunflow.jar -bench 2>&1" > sunflow
# chmod +x sunflow
# cd ../

# echo "-------Downloading and installing sqlitebench"
# mkdir sqlitebench && cd sqlitebench
# wget  http://sqlite.org/2019/sqlite-autoconf-3300100.tar.gz
# tar -xzvf sqlite-autoconf-3300100.tar.gz && rm sqlite-autoconf-3300100.tar.gz
# mv sqlite-autoconf-3300100/* ./ && rm -rf sqlite-autoconf-3300100/
# wget http://www.phoronix-test-suite.com/benchmark-files/pts-sqlite-tests-1.tar.gz
# tar -xzvf pts-sqlite-tests-1.tar.gz && rm pts-sqlite-tests-1.tar.gz
# ./configure --prefix=`pwd`
# make -j $(nproc --all)
# make install
# echo "
# #!/bin/sh
# rm benchmark.db
# sqlite3 benchmark.db  \"CREATE TABLE pts1 ('I' SMALLINT NOT NULL, 'DT' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 'F1' VARCHAR(4) NOT NULL, 'F2' VARCHAR(16) NOT NULL);\"
# cat sqlite-2500-insertions.txt | sqlite3 benchmark.db" > sqlitebench
# chmod +x sqlitebench
# cd ../

# echo "-------Downloading and installing iozone"
# mkdir iozone && cd iozone
# wget http://iozone.org/src/current/iozone3_465.tar
# tar -xf iozone3_465.tar && rm iozone3_465.tar
# mv iozone3_465/* ./ && rm -rf iozone3_465
# cd src/current/
# make linux
# cp iozone ../../
# cd ../

# echo "-------Downloading and installing dbench"
# mkdir dbench && cd dbench
# wget http://samba.org/ftp/tridge/dbench/dbench-4.0.tar.gz
# tar -xf dbench-4.0.tar.gz && rm dbench-4.0.tar.gz
# mv dbench-4.0/* ./ && rm -rf dbench-4.0
# ./autogen.sh
# ./configure --prefix=`pwd`
# make -j $(nproc --all)
# make install
# cp ../../$taskScripts/dbench ./
# cd ../

# echo "-------Downloading and installing postmark"
# mkdir postmark && cd postmark
# wget http://archive.debian.org/debian/pool/main/p/postmark/postmark_1.51.orig.tar.gz
# tar -xzvf postmark_1.51.orig.tar.gz && rm postmark_1.51.orig.tar.gz
# mv postmark-1.51/* ./ && rm -rf postmark-1.51
# cc -O3 postmark-1.51.c -o postmark
# cp ../../${taskScripts}/postmark.pmrc ./
# cd ../

# echo "-------Downloading and installing fs-mark"
# mkdir fs-mark && cd fs-mark
# wget http://www.phoronix-test-suite.com/benchmark-files/fs_mark-3.3.tar.gz
# tar -xzvf fs_mark-3.3.tar.gz && rm fs_mark-3.3.tar.gz
# mv fs_mark-3.3/* ./ && rm -rf fs_mark-3.3/
# make -j $(nproc --all)
# echo "#!/bin/bash
# case \$1 in
# 	(\"1000_Files_1MB_Size\")
# 		getConfigurations=\"-s 1048576 -n 1000\";;
# 	(\"1000_Files_1MB_Size_No_Sync_FSync\")
# 		getConfigurations=\"-s 1048576 -n 1000 -S 0\";;
# 	(\"5000_Files_1MB_Size_4_Threads\")
# 		getConfigurations=\"-s 1048576 -n 5000 -t 4\";;
# 	(\"4000_Files_32_Sub_Dirs_1MB_Size\")
# 		getConfigurations=\"-s 1048576 -n 4000 -D 32\";;
# esac
# ./fs_mark -d ./scratch/ \$getConfigurations" > fs-mark
# chmod +x fs-mark
# mkdir scratch
# cd ../

# echo "-------Downloading and installing bork"
# mkdir bork && cd bork
# wget http://www.phoronix-test-suite.com/benchmark-files/bork-1.4.zip
# unzip bork-1.4.zip && rm bork-1.4.zip
# mv bork-1.4/* ./ && rm -rf bork-1.4/
# echo "#!/bin/bash
# dd if=/dev/zero of=encryptfile bs=2048 count=1048576
# BORK_PASSWORD=phoronixtestsuite123 ./bork.sh ./encryptfile
# rm -f encryptfile.bork
# rm -f encryptfile" > bork
# chmod +x bork
# cd ../

# echo "-------Downloading and installing ffmpeg"
# mkdir ffmpeg && cd ffmpeg
# wget http://ffmpeg.org/releases/ffmpeg-4.0.2.tar.bz2
# tar -xjvf ffmpeg-4.0.2.tar.bz2 && rm ffmpeg-4.0.2.tar.bz2
# mv ffmpeg-4.0.2/* ./ && rm -rf ffmpeg-4.0.2/
# wget http://samples.ffmpeg.org/V-codecs/h264/HD2-h264.ts
# ./configure --disable-zlib --disable-doc --prefix=`pwd`
# make -j $(nproc --all)
# make install
# echo "#!/bin/bash
# bin/ffmpeg -i HD2-h264.ts -f rawvideo -threads \$(nproc --all) -y -target ntsc-dv /dev/null" > ffmpeg
# chmod +x ffmpeg
# cd ../

# echo "-------Downloading and installing encode-mp3"
# mkdir encode-mp3 && cd encode-mp3
# wget http://ftp.osuosl.org/pub/blfs/conglomeration/lame/lame-3.100.tar.gz
# tar -xzvf lame-3.100.tar.gz && rm lame-3.100.tar.gz
# mv lame-3.100/* ./ && rm -rf lame-3.100/
# autoconf
# ./configure --prefix=`pwd` --enable-expopt=full
# make
# make install
# wget https://www.phoronix.net/downloads/phoronix-test-suite/benchmark-files/pts-trondheim-wav-3.tar.gz
# tar -xzvf pts-trondheim-wav-3.tar.gz && rm pts-trondheim-wav-3.tar.gz
# echo "#!/bin/bash
# ./bin/lame -h pts-trondheim-3.wav" > encode-mp3
# chmod +x encode-mp3
# cd ../

echo "-------Downloading and installing graphics-magick"
mkdir graphics-magick && cd graphics-magick
wget ftp://ftp.graphicsmagick.org/pub/GraphicsMagick/1.3/GraphicsMagick-1.3.33.tar.bz2
tar -xjf GraphicsMagick-1.3.33.tar.bz2 && rm GraphicsMagick-1.3.33.tar.bz2
mv GraphicsMagick-1.3.33/* ./ && rm -rf GraphicsMagick-1.3.33/
./configure --without-perl --prefix=`pwd` --without-png
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

echo "-------Downloading and installing rocksdb"
mkdir rocksdb && cd rocksdb
wget https://github.com/facebook/rocksdb/archive/v6.3.6.tar.gz
tar -xf v6.3.6.tar.gz && rm v6.3.6.tar.gz
mv rocksdb-6.3.6/* ./ && rm -rf rocksdb-6.3.6
mkdir build
cd build
export CFLAGS="-O3 -march=native"
export CXXFLAGS="-O3 -march=native"
cmake -DCMAKE_BUILD_TYPE=Release  ..
make -j $(nproc --all)
make db_bench  
cd ../
echo "#!/bin/sh
cd build/
./db_bench --benchmarks=\"\$1\" -compression_type \"none\" --threads \$(nproc --all) --duration 30 " > rocksdb
chmod +x rocksdb
cd ../