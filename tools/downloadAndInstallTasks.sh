#!/bin/bash

taskDirectory='tasks_test'
taskScripts='scripts'

echo "-------Downloading and installing aio-stress"
mkdir aio-stress && cd aio-stress
wget http://fsbench.filesystems.org/bench/aio-stress.c
cc -Wall -pthread -o aio-stress aio-stress.c -laio
cd ../ && mv aio-stress ${taskDirectory}/

echo "-------Downloading and installing aircrack-ng"
mkdir aircrack-ng && cd aircrack-ng
wget https://download.aircrack-ng.org/aircrack-ng-1.3.tar.gz
tar -zxvf aircrack-ng-1.3.tar.gz && rm aircrack-ng-1.3.tar.gz
mv aircrack-ng-1.3/* ./ && rm -rf aircrack-ng-1.3/
./autogen.sh
make -j $(nproc --all)
cp ../${taskScripts}/aircrack-ng ./
cd ../ && mv aircrack-ng ${taskDirectory}/

echo "-------Downloading and install gnupg"
mkdir gnupg && cd gnupg
wget http://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.19.tar.bz2
tar -jxvf gnupg-2.2.19.tar.bz2 && rm gnupg-2.2.19.tar.bz2
mv gnupg-2.2.19/* ./ && rm -rf gnupg-2.2.19 
cp ${taskScripts}/gnupg ./
./configure --prefix=`pwd`
make -j $(nproc --all)
make install
echo pts-1234567890 > passphrase
cd ../ && mv gnupg ${taskDirectory}/

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


mv tasks_test ../

