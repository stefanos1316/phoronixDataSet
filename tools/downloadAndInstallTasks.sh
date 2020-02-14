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

echo "-------Downloading and installing build-linux-kernel"
mkdir build-linux-kernel && cd build-linux-kernel
cp ../../../inputs/linux-5.3.tar.gz ./
tar -xzvf linux-5.3.tar.gz && rm linux-5.3.tar.gz
cp ../../$taskScripts/build-linux-kernel ./
cd ../

# echo "-------Downloading and install gnupg"
# mkdir gnupg && cd gnupg
# wget http://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.19.tar.bz2
# tar -jxvf gnupg-2.2.19.tar.bz2 && rm gnupg-2.2.19.tar.bz2
# mv gnupg-2.2.19/* ./ && rm -rf gnupg-2.2.19 
# cp ${taskScripts}/gnupg ./
# ./configure --prefix=`pwd`
# make -j $(nproc --all)
# make install
# echo pts-1234567890 > passphrase
# cd ../ && mv gnupg ${taskDirectory}/

# echo "-------Downloading and installing botan"
# mkdir -p ../${taskDirectory}/botan
# wget http://botan.randombit.net/releases/Botan-2.8.0.tgz
# tar -xf Botan-2.8.0.tgz && rm Botan-2.8.0.tgz
# mv Botan-2.8.0/* ../${taskDirectory}/botan/ && rm -rf Botan-2.8.0 
# cp ${taskScripts}/botan ../${taskDirectory}/botan/

# echo "-------Installing botan"
# cd ../${taskDirectory}/botan
# python3 ./configure.py
# make -j $(nproc --all)
# mv botan botan_bin
# cd ../../tools


