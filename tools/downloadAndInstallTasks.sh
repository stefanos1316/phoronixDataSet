#!/bin/bash

taskDirectory='task_test'
taskScripts='scripts'

echo "-------Downloading aio-stress"
mkdir -p ../${taskDirectory}/aio-stress
wget http://fsbench.filesystems.org/bench/aio-stress.c
mv aio-stress.c/* ../${taskDirectory}/aio-stress/ 

echo "-------Installing aio-stress"
cd ../${taskDirectory}/aio-stress
cc -Wall -pthread -o aio-stress aio-stress.c -laio
cd ../../tools


# echo "-------Downloading gnupg"
# mkdir -p ../${taskDirectory}/gnupg
# wget http://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.19.tar.bz2
# tar -jxvf gnupg-2.2.19.tar.bz2 && rm gnupg-2.2.19.tar.bz2
# mv gnupg-2.2.19/* ../${taskDirectory}/gnupg/ && rm -rf gnupg-2.2.19 
# cp ${taskScripts}/gnupg ../${taskDirectory}/gnupg/

# echo "-------Installing gnupg"
# cd ../${taskDirectory}/gnupg
# ./configure --prefix=`pwd`
# make -j $(nproc --all)
# make install
# echo pts-1234567890 > passphrase
# cd ../../tools

# echo "-------Downloading botan"
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

