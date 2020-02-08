#!/bin/bash

echo "This might take some time, lay back, enjoy a coffee, watch a movie (do not use the network for that), and let the magic happen!"

echo "Download data for x264 and x265"
wget http://ultravideo.cs.tut.fi/video/Bosphorus_1920x1080_120fps_420_8bit_YUV_Y4M.7z
7z x Bosphorus_1920x1080_120fps_420_8bit_YUV_Y4M.7z
rm Bosphorus_1920x1080_120fps_420_8bit_YUV_Y4M.7z
mv Bosphorus_1920x1080_120fps_420_8bit_YUV.y4m ../inputs

