#!/bin/bash

cd ../task_test
echo "-------Downloading gnupg"
mkdir gnupg && cd gnupg
wget http://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.19.tar.bz2
tar -jxvf gnupg-2.2.19.tar.bz2 && rm gnupg-2.2.19.tar.bz2
mv gnupg-2.2.19/* ./ && rm -rf gnupg-2.2.19 

echo "-------Installing gnupg"
./configure --prefix=`pwd`
make -j $(nproc --all)
make install
cd ../