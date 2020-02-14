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

echo "-------Downloading and installing scimark2"
wget http://www.phoronix-test-suite.com/benchmark-files/scimark2_1c.zip
unzip scimark2_1c.zip -d scimark2 && rm scimark2_1c.zip && cd scimark2
cc -O3 -o scimark2 *.c -lm
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


