#!/bin/bash

echo "This might take some time, lay back, enjoy a coffee, watch a movie (do not use the network for that), and let the magic happen!"

echo "Downloading data for x264 and x265"
wget http://ultravideo.cs.tut.fi/video/Bosphorus_1920x1080_120fps_420_8bit_YUV_Y4M.7z
7z x Bosphorus_1920x1080_120fps_420_8bit_YUV_Y4M.7z
rm Bosphorus_1920x1080_120fps_420_8bit_YUV_Y4M.7z
mv Bosphorus_1920x1080_120fps_420_8bit_YUV.y4m ../inputs

echo "Generating data for zstd and xd"
bash generateBinaryData.sh -n zstdData -z 10000000 -f 10000000 -d 1
bash generateBinaryData.sh -n xzData -z 250000 -f 250000 -d 1
mv zstdData/1 ../inputs/zstd_test
rm -rf zstdData
mv xzData/1 ../inputs/xz.txt
rm -rf xzData

echo "Downloading linux kernel 4.3"
wget https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.3.tar.gz
mv linux-4.3.tar.gz ../inputs

echo "Downloading GCC 8.2"
wget ftp://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-8.2.0/gcc-8.2.0.tar.gz
mv gcc-8.2.0.tar.gz ../inputs

echo "Downloading DaCapo"
wget http://download2.nust.na/pub4/sourceforge/d/da/dacapobench/9.12-bach-MR1/dacapo-9.12-MR1-bach.jar
mkdir -p ../tasks/dacapo
mv dacapo-9.12-MR1-bach.jar ../tasks/dacapo/dacapo.jar 