#!/bin/bash

taskDirectory='tasks_test'
taskScripts='scripts'
mkdir tasks_test 
cd tasks_test

echo "-------Downloading and installing aio-stress"
mkdir aio-stress && cd aio-stress
wget http://fsbench.filesystems.org/bench/aio-stress.c
cc -Wall -pthread -o aio-stress aio-stress.c -laio
cd ../

echo "-------Downloading and installing xonotic"
mkdir xonotic && cd xonotic
wget http://dl.xonotic.org/xonotic-0.8.2.zip
unzip xonotic-0.8.2.zip && rm xonotic-0.8.2.zip
mv Xonotic/* ./ && rm -rf Xonotic
echo "#!/bin/sh
case \$1 in
	(\"800x600\")
		getConfigurations=\"+vid_width 800 +vid_height 600\";;
	(\"1024x768\")
		getConfigurations=\"+vid_width 1024 +vid_height 768\";;
	(\"1920x1080\")
		getConfigurations=\"+vid_width 1920 +vid_height 1080\";;
	(\"2560x1440\")
		getConfigurations=\"+vid_width 2560 +vid_height 1440\";;
esac
./xonotic-linux64-sdl -nohome -benchmark demos/the-big-keybench +r_glsl 1 \$getConfigurations" > xonotic
chmod +x xonotic
cd ../

echo "-------Downloading and installing j2dbench"
mkdir j2dbench && cd j2dbench
wget http://www.phoronix-test-suite.com/benchmark-files/J2DBench.zip
unzip J2DBench.zip && rm J2DBench.zip
echo "#!/bin/sh
rm -f *.output
rm -f *.res
case \"\$1\" in
\"all\")
  TEST_TYPE=all ;;
\"graphics\")
  TEST_TYPE=graphics ;;
\"images\")
  TEST_TYPE=images ;;
\"text\")
  TEST_TYPE=text ;;
esac
java -Dsun.java2d.opengl=True -jar dist/J2DBench.jar \
-batch -loadopts \$TEST_TYPE.opt -saveres \$TEST_TYPE.res \
-title \$TEST_TYPE -desc \$TEST_TYPE > \$THIS_RUN_TIME.output
java -jar dist/J2DAnalyzer.jar \$TEST_TYPE.res" > j2dbench
chmod +x j2dbench
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
make -j $(nproc --all)
mv qgears qgears-bin
echo "#!/bin/bash
export QT_QPA_PLATFORM='offscreen'
for i in {1..10}; do
./qgears-bin \$1
done" > qgears
chmod +x qgears
cd ../

echo "-------Downloading and installing indigobench"
mkdir indigobench && cd indigobench
wget ftp://ftp-osl.osuosl.org/pub/libpng/src/libpng12/libpng-1.2.59.tar.gz
tar -xf libpng-1.2.59.tar.gz && rm libpng-1.2.59.tar.gz 
mkdir libpng
cd libpng-1.2.59
./configure --prefix=`pwd/../libpng`
make -j $(nproc --all)
make install
cd ../
wget http://downloads.indigorenderer.com/dist/beta/IndigoBenchmark_x64_v4.0.64.tar.gz
tar -xf IndigoBenchmark_x64_v4.0.64.tar.gz && rm IndigoBenchmark_x64_v4.0.64.tar.gz
mv IndigoBenchmark_x64_v4.0.64/* ./ && rm -rf IndigoBenchmark_x64_v4.0.64
echo "#!/bin/bash
./indigo_benchmark --silent --scenes \$1" > indigobench
chmod +x indigobench
cd ../

echo "-------Downloading and installing jxrend"
mkdir jxrend && cd jxrend
wget http://www.phoronix-test-suite.com/benchmark-files/JXRenderMark-1.0.1.zip
unzip JXRenderMark-1.0.1.zip && rm JXRenderMark-1.0.1.zip
cc JXRenderMark.c -o jxrend -lX11 -lXrender -O3
cd ../

echo "-------Downloading and installing paraview"
mkdir paraview && cd paraview
wget http://www.paraview.org/files/v5.4/ParaView-5.4.1-Qt5-OpenGL2-MPI-Linux-64bit.tar.gz
tar -xzvf ParaView-5.4.1-Qt5-OpenGL2-MPI-Linux-64bit.tar.gz && rm ParaView-5.4.1-Qt5-OpenGL2-MPI-Linux-64bit.tar.gz
mv ParaView-5.4.1-Qt5-OpenGL2-MPI-Linux-64bit/* ./ && rm -rf ParaView-5.4.1-Qt5-OpenGL2-MPI-Linux-64bit
echo "#!/bin/sh
case \$1 in 
    (\"manyspheres\")
        configurations=\"manyspheres.py -s 100 -r 726 -f 30\";;
    (\"waveletcontour\")
        configurations=\"waveletcontour.py -d 256 -f 600\";;
    (\"waveletvolume\")
        configurations=\"waveletvolume.py -d 256 -f 1200\";;
esac
./bin/pvpython lib/python2.7/site-packages/paraview/benchmark/\$configurations" > paraview
chmod +x paraview
cd ../

echo "-------Downloading and installing warsow"
mkdir warsow && cd warsow
wget http://warsow.net/warsow-2.1.2.tar.gz
tar -xzvf warsow-2.1.2.tar.gz && rm warsow-2.1.2.tar.gz
mv warsow-2.1.2/* ./ && rm -rf warsow-2.1.2/
wget http://www.phoronix-test-suite.com/benchmark-files/pts-warsow-15-1.zip
unzip pts-warsow-15-1.zip && rm pts-warsow-15-1.zip
chmod +x warsow.*
mkdir -p basewsw/demos
cp -f pts1.wdz20 basewsw/demos
echo "#!/bin/sh
case \$1 in
	(\"800x600\")
		getConfigurations=\"+vid_customwidth 800 +vid_customheight 600\";;
	(\"1024x768\")
		getConfigurations=\"+vid_customwidth 1024 +vid_customheight 768\";;
	(\"1920x1080\")
		getConfigurations=\"+vid_customwidth 1920 +vid_customheight 1080\";;
	(\"2560x1440\")
		getConfigurations=\"+vid_customwidth 2560 +vid_customheight 1440\";;
esac
./warsow.x86_64 +logconsole pts-log +exec profiles/high+.cfg +timedemo 1 \
 +cg_showFPS 1 +cl_maxfps 999 +cl_checkForUpdate 0 +demo pts1 +next \"quit\" +r_mode -1 \$getConfigurations " > warsow
chmod +x warsow
cd ../

echo "-------Downloading and installing nexuiz"
mkdir nexuiz && cd nexuiz
wget http://ftp.vim.org/pub/pub/os/Linux/distr/vectorlinux/veclinux-7.0/source/abs/games/nexuiz/nexuiz-252.zip
unzip nexuiz-252.zip && rm nexuiz-252.zip
mv Nexuiz/* ./ && rm -rf Nexuiz/
echo "#!/bin/sh
case \$1 in
	(\"800x600\")
		getConfigurations=\"+vid_width 800 +vid_height 600\";;
	(\"1024x768\")
		getConfigurations=\"+vid_width 1024 +vid_height 768\";;
	(\"1920x1080\")
		getConfigurations=\"+vid_width 1920 +vid_height 1080\";;
	(\"2560x1440\")
		getConfigurations=\"+vid_width 2560 +vid_height 1440\";;
esac
./nexuiz-linux-glx.sh +exec effects-high.cfg -nohome -benchmark demos/demo2 +r_glsl 1 \$getConfigurations " > nexuiz
chmod +x nexuiz
cd ../

echo "-------Downloading and installing glmark2"
mkdir glmark2 && cd glmark2
wget http://phoronix-test-suite.com/benchmark-files/glmark2-20170617.tar.gz
tar -xzvf glmark2-20170617.tar.gz && rm glmark2-20170617.tar.gz
mv glmark2-20170617/* ./ && rm -rf glmark2-20170617
./waf configure --with-flavors=x11-gl --prefix=`pwd`
./waf build
./waf install
echo "#!/bin/sh
cd bin/
./glmark2 -s \$1" > glmark2
chmod +x glmark2
cd ../

echo "-------Downloading and installing unigine-valley"
mkdir unigine-valley && cd unigine-valley
wget http://assets.unigine.com/d/Unigine_Valley-1.0.run
chmod +x Unigine_Valley-1.0.run
./Unigine_Valley-1.0.run --nox11
echo "#!/bin/sh
cd Unigine_Valley-1.0/
export LD_LIBRARY_PATH=bin/:\$LD_LIBRARY_PATH
case \$1 in
	(\"800x600\")
		getConfigurations=\"-video_width 800 -video_height 600 \
        -sound_app null -engine_config ../data/valley_1.0.cfg \
        -system_script valley/unigine.cpp -video_mode -1 \
        video_fullscreen 1 -extern_define PHORONIX,RELEASE \";;
	(\"1024x768\")
		getConfigurations=\"-video_width 1024 -video_height 768 \
        -sound_app null -engine_config ../data/valley_1.0.cfg \
        -system_script valley/unigine.cpp -video_mode -1 \
        video_fullscreen 1 -extern_define PHORONIX,RELEASE \";;
	(\"1920x1080\")
		getConfigurations=\"-video_width 1920 -video_height 1080 \
        -sound_app null -engine_config ../data/valley_1.0.cfg \
        -system_script valley/unigine.cpp -video_mode -1 \
        video_fullscreen 1 -extern_define PHORONIX,RELEASE \";;
	(\"2560x1440\")
		getConfigurations=\"-video_width 2560 -video_height 1440 \
        -sound_app null -engine_config ../data/valley_1.0.cfg \
        -system_script valley/unigine.cpp -video_mode -1 \
        video_fullscreen 1 -extern_define PHORONIX,RELEASE \";;
esac
./bin/valley_x64 -data_path ../ \$getConfigurations" > unigine-valley
chmod +x unigine-valley
cd ../

echo "-------Downloading and installing unigine-heaven"
mkdir unigine-heaven && cd unigine-heaven
wget http://www.phoronix-test-suite.com/benchmark-files/Unigine_Heaven-4.0.run
chmod +x Unigine_Heaven-4.0.run
./Unigine_Heaven-4.0.run --nox11
echo "#!/bin/sh
cd Unigine_Heaven-4.0/
export LD_LIBRARY_PATH=bin/:\$LD_LIBRARY_PATH
case \$1 in
	(\"800x600\")
		getConfigurations=\"-video_width 800 -video_height 600 \
        -sound_app null -engine_config ../data/heaven_4.0.cfg \
        -system_script heaven/unigine.cpp -video_mode -1 \
        video_fullscreen 1 -extern_define PHORONIX,RELEASE \";;
	(\"1024x768\")
		getConfigurations=\"-video_width 1024 -video_height 768 \
        -sound_app null -engine_config ../data/heaven_4.0.cfg \
        -system_script heaven/unigine.cpp -video_mode -1 \
        video_fullscreen 1 -extern_define PHORONIX,RELEASE \";;
	(\"1920x1080\")
		getConfigurations=\"-video_width 1920 -video_height 1080 \
        -sound_app null -engine_config ../data/heaven_4.0.cfg \
        -system_script heaven/unigine.cpp -video_mode -1 \
        video_fullscreen 1 -extern_define PHORONIX,RELEASE \";;
	(\"2560x1440\")
		getConfigurations=\"-video_width 2560 -video_height 1440 \
        -sound_app null -engine_config ../data/heaven_4.0.cfg \
        -system_script heaven/unigine.cpp -video_mode -1 \
        video_fullscreen 1 -extern_define PHORONIX,RELEASE \";;
esac
./bin/heaven_x64 -data_path ../ \$getConfigurations" > unigine-heaven
chmod +x unigine-heaven
cd ../

echo "-------Downloading and installing unigine-super"
mkdir unigine-super && cd unigine-super
wget https://assets.unigine.com/d/Unigine_Superposition-1.0.run
chmod +x Unigine_Superposition-1.0.run
./Unigine_Superposition-1.0.run --nox11
echo "#!/bin/bash
case \$1 in
	(\"800x600\")
		getConfigurations=\"-video_width 800 -video_height 600 \
        -sound_app null -engine_config ../data/superposition/unigine.cfg \
        -system_script superposition/system_script.cpp -video_mode -1 \
        video_fullscreen 1 -extern_define PHORONIX,RELEASE \
        -sound_app openal -project_name Superposition -mode 2 -preset 0 \";;
	(\"1024x768\")
		getConfigurations=\"-video_width 1024 -video_height 768 \
        -sound_app null -engine_config ../data/superposition/unigine.cfg \
        -system_script superposition/system_script.cpp -video_mode -1 \
        video_fullscreen 1 -extern_define PHORONIX,RELEASE \
        -sound_app openal -project_name Superposition -mode 2 -preset 0 \";;
	(\"1920x1080\")
		getConfigurations=\"-video_width 1920 -video_height 1080 \
        -sound_app null -engine_config ../data/superposition/unigine.cfg \
        -system_script superposition/system_script.cpp -video_mode -1 \
        video_fullscreen 1 -extern_define PHORONIX,RELEASE \
        -sound_app openal -project_name Superposition -mode 2 -preset 0 \";;
	(\"2560x1440\")
		getConfigurations=\"-video_width 2560 -video_height 1440 \
        -sound_app null -engine_config ../data/superposition/unigine.cfg \
        -system_script superposition/system_script.cpp -video_mode -1 \
        video_fullscreen 1 -extern_define PHORONIX,RELEASE \
        -sound_app openal -project_name Superposition -mode 2 -preset 0 \";;
esac
cd Unigine_Superposition-1.0/
rm -f ~/.Superposition/automation/log*.txt
./bin/superposition  -data_path ../  -console_command \"config_readonly 1 && world_load superposition/superposition\" \
\$getConfigurations" > unigine-super
chmod +x unigine-super
cd ../

echo "-------Downloading and installing openarena"
mkdir openarenaG && cd openarenaG
wget http://iweb.dl.sourceforge.net/project/oarena/openarena-0.8.8.zip
unzip openarena-0.8.8.zip && rm openarena-0.8.8.zip
mv openarena-0.8.8/* ./ && rm -rf openarena-0.8.8 
wget http://www.phoronix-test-suite.com/benchmark-files/openarena-088-1.zip
unzip openarena-088-1.zip && rm openarena-088-1.zip
mv pts-openarena-088.cfg baseoa/
chmod +x openarena.x86_64
echo "#!/bin/bash
case \$1 in
	(\"800x600\")
		getConfigurations=\"+set r_customWidth 800 +set r_customHeight 600\";;
	(\"1024x768\")
		getConfigurations=\"+set r_customWidth 1024 +set r_customHeight 768\";;
	(\"1920x1080\")
		getConfigurations=\"+set r_customWidth 1920 +set r_customHeight 1080\";;
	(\"2560x1440\")
		getConfigurations=\"+set r_customWidth 2560 +set r_customHeight 1440\";;
esac
./openarena.x86_64 +exec pts-openarena-088 +set r_mode -1 +set r_fullscreen 1 +set com_speeds 1 \$getConfigurations" >openarenaG
chmod +x openarenaG
cd ../

echo "-------Downloading and installing urbanterror"
mkdir urbanterrorG && cd urbanterrorG
wget http://cdn.urbanterror.info/urt/43/releases/zips/UrbanTerror432_full.zip
unzip UrbanTerror432_full.zip && rm UrbanTerror432_full.zip
mv UrbanTerror43/* ./ && rm -rf UrbanTerror43/
chmod +x Quake3-UrT.app/Contents/MacOS/Quake3-UrT.i386 
wget http://www.phoronix-test-suite.com/benchmark-files/urbanterror-43-1.zip
unzip urbanterror-43-1.zip && rm urbanterror-43-1.zip
rm -f q3ut4/autoexec.cfg
mv autoexec.cfg q3ut4/
mkdir q3ut4/demos/
mv pts-ut43.urtdemo q3ut4/demos/
chmod +x Quake3-UrT.x86_64
echo "#!/bin/bash
case \$1 in
	(\"800x600\")
		getConfigurations=\"+set r_customWidth 800 +set r_customHeight 600\";;
	(\"1024x768\")
		getConfigurations=\"+set r_customWidth 1024 +set r_customHeight 768\";;
	(\"1920x1080\")
		getConfigurations=\"+set r_customWidth 1920 +set r_customHeight 1080\";;
	(\"2560x1440\")
		getConfigurations=\"+set r_customWidth 2560 +set r_customHeight 1440\";;
esac
./Quake3-UrT.x86_64 +timedemo 1 +set demodone \"quit\" +set demoloop1 \"demo pts-ut43; \
set nextdemo vstr demodone\" +vstr demoloop1 +set com_speeds 1 \$getConfigurations" > urbanterrorG
chmod +x urbanterrorG
cd ../

echo "-------Downloading and installing mt-dgemm"
mkdir mt-dgemm && cd mt-dgemm
wget http://phoronix-test-suite.com/benchmark-files/mtdgemm-crossroads-v1.0.0.tgz
tar -xf mtdgemm-crossroads-v1.0.0.tgz && rm mtdgemm-crossroads-v1.0.0.tgz
mv mt-dgemm/* ./ && rm -rf mt-dgemm
cc -O3 -march=native -fopenmp -o mtdgemm src/mt-dgemm.c
echo "#!/bin/sh
export OMP_NUM_THREADS=\$(nproc --all)
export OMP_PLACES=cores
export OMP_PROC_BIND=close
./mtdgemm 3072 4" > mt-dgemm
chmod +x mt-dgemm
cd ../

echo "-------Downloading and installing ramspeed"
mkdir ramspeed && cd ramspeed
wget http://www.phoronix-test-suite.com/benchmark-files/ramsmp-3.5.0.tar.gz
tar -xzvf ramsmp-3.5.0.tar.gz && rm ramsmp-3.5.0.tar.gz
mv ramsmp-3.5.0/* ./ && rm -rf ramsmp-3.5.0
cc -O3 -march=native -o ramsmp fltmark.c fltmem.c intmark.c intmem.c ramsmp.c
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
LIBS="-lboost_system" ./configure COMPILED_BY="justarandom@gmail.com" --with-boost-thread=boost_thread
make -j $(nproc --all)
echo "#!/bin/sh
echo 1 | ./unix/povray -benchmark" > povray
chmod +x povray
cd ../

echo "-------Downloading and installing bzip2"
mkdir bzip2 && cd bzip2
wget http://downloads.openwrt.org/sources/bzip2-1.0.6.tar.gz
tar -xzvf bzip2-1.0.6.tar.gz && rm bzip2-1.0.6.tar.gz
mv bzip2-1.0.6/* ./ && rm -rf bzip2-1.0.6
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
make arch=Linux_MPI
echo "#!/bin/bash
rm -f HPCG-Benchmark*.txt
cd bin/
mpirun --allow-run-as-root -np 8 ./xhpcg" > hpcg
chmod +x hpcg
cd ../

echo "-------Downloading and installing sockperf"
mkdir sockperf && cd sockperf
wget http://phoronix-test-suite.com/benchmark-files/sockperf-3.4.zip
unzip sockperf-3.4.zip && rm sockperf-3.4.zip
mv sockperf-3.4/* ./ && rm -rf sockperf-3.4/
./autogen.sh
./configure
make -j $(nproc --all)
echo "#!/bin/sh
./sockperf server &
sleep 5
./sockperf \$@
killall -9 sockperf" > sockperf
chmod +x sockperf
cd ../

echo "-------Downloading and installing apache"
mkdir apache && cd apache
wget http://archive.apache.org/dist/httpd/httpd-2.4.29.tar.bz2
tar -xjvf httpd-2.4.29.tar.bz2 && rm httpd-2.4.29.tar.bz2
mv httpd-2.4.29/* ./ && rm -rf httpd-2.4.29/
./configure
make --j $(nproc --all)
sudo make install
cd ../

echo "-------Downloading and installing ctx-clock"
mkdir ctx_clock && cd ctx_clock
cp ../../$taskScripts/ctx_clock.c ./ctx-clock.c
cc ctx-clock.c -o ctx-clock
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
make -j $(nproc --all)
echo "#!/bin/bash
./src/aircrack-ng -w ../../../inputs/aircrack.txt ../../../inputs/wpa.cap" > aircrack-ng
chmod +x aircrack-ng
cd ../

echo "-------Downloading and installing aobench"
mkdir aobench && cd aobench
wget http://phoronix-test-suite.com/benchmark-files/aobench-20180207.zip
unzip aobench-20180207.zip && rm aobench-20180207.zip
cc ao.c -o aobench -lm -O3
cd ../

echo "-------Downloading and installing nginx"
mkdir nginx && cd nginx
wget http://nginx.org/download/nginx-1.9.9.tar.gz
tar -zxvf nginx-1.9.9.tar.gz && rm nginx-1.9.9.tar.gz
mv nginx-1.9.9/* ./ && rm -rf nginx-1.9.9/
./configure
sed -i 's/\-Werror//g' objs/Makefile
make -j $(nproc --all)
sudo make install
cd ../

echo "-------Downloading and installing crafty"
mkdir crafty && cd crafty
wget http://craftychess.com/downloads/source/crafty-25.2.zip
unzip crafty-25.2.zip && rm crafty-25.2.zip
make unix-gcc
cd ../

echo "-------Downloading and installing tscp"
mkdir tscp && cd tscp
wget http://www.phoronix-test-suite.com/benchmark-files/tscp181_pts.tar.bz2
tar -xjvf tscp181_pts.tar.bz2 && rm tscp181_pts.tar.bz2
mv tscp181/* ./ && rm -rf tscp181
cp ../../${taskScripts}/tscp_main.c ./main.c
cc -O3 *.c -o tscp
cd ../

echo "-------Downloading and installing stockfish"
mkdir stockfish && cd stockfish
wget http://www.phoronix-test-suite.com/benchmark-files/stockfish-9-src.zip
unzip stockfish-9-src.zip && rm stockfish-9-src.zip
cd src
make build ARCH=x86-64-modern
cp stockfish ../stockfish-bin
cd ../
echo "#!/bin/bash
for i in {1..20}; do
	./stockfish-bin bench
done" > stockfish
chmod +x stockfish
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
make -j $(nproc --all)
mv zstd zstd-bin
cp ../../../inputs/linux-5.3.tar.gz ./
echo "#!/bin/bash
./zstd-bin -19 -T\$(nproc --all) linux-5.3.tar.gz
rm -f linux-5.3.tar.gz.zst" > zstd
chmod +x zstd
cd ../

echo "-------Downloading and installing xz"
mkdir xz && cd xz
wget http://distfiles.macports.org/xz/xz-5.2.4.tar.bz2
tar -xvf xz-5.2.4.tar.bz2 && rm xz-5.2.4.tar.bz2
mv  xz-5.2.4/* ./ && rm -rf xz-5.2.4/
./configure
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
make
mv Run byte
cd ../

echo "-------Downloading and installing scimark2"
wget http://www.phoronix-test-suite.com/benchmark-files/scimark2_1c.zip
unzip scimark2_1c.zip -d scimark2 && rm scimark2_1c.zip && cd scimark2
cc -O3 -o scimark2 *.c -lm
cd ../

echo "-------Downloading and installing fhourstones"
mkdir fhourstones && cd fhourstones
wget http://www.phoronix-test-suite.com/benchmark-files/Fhourstones.tar.gz
tar -xzvf Fhourstones.tar.gz && rm Fhourstones.tar.gz 
cp ../../$taskScripts/SearchGame.c ./
make -j $(nproc --all)
mv SearchGame fhourstones
cd ../

echo "-------Downloading and installing gmpbench"
mkdir gmpbench && cd gmpbench
wget ftp://ftp.gmplib.org/pub/misc/gmpbench-0.2.tar.bz2
tar -xjvf gmpbench-0.2.tar.bz2 && rm gmpbench-0.2.tar.bz2
mv gmpbench-0.2/* ./ && rm -rf gmpbench-0.2
wget http://www.phoronix.net/downloads/phoronix-test-suite/benchmark-files/gexpr.c.tar.gz
tar -xvzf gexpr.c.tar.gz && rm gexpr.c.tar.gz 
cc -O3 gexpr.c -o gexpr -lm
mv runbench ./gmpbench
cd ../

echo "-------Downloading and installing dcraw"
mkdir dcraw && cd dcraw
wget http://www.phoronix-test-suite.com/benchmark-files/dcraw-test-1.tar.bz2
tar -xjvf dcraw-test-1.tar.bz2 && rm dcraw-test-1.tar.bz2
cc -o dcraw -O3 dcraw.c -lm -DNO_JPEG -DNO_LCMS
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

echo "-------Downloading and installing sudokut"
mkdir sudokut && cd sudokut
wget http://www.phoronix-test-suite.com/benchmark-files/sudokut0.4-1.tar.bz2
tar -xjvf sudokut0.4-1.tar.bz2 && rm sudokut0.4-1.tar.bz2
mv sudokut0.4/* ./ && rm -rf sudokut0.4/
mv sudokut sudokut-bin
cp ../../$taskScripts/sudokut.sh ./
sed -i 's/sudokut/sudokut\-bin/g' sudokut.sh
mv sudokut.sh sudokut
cd ../

echo "-------Downloading and installing nero2d"
mkdir nero2d && cd nero2d
wget http://www.phoronix-test-suite.com/benchmark-files/nero2d-2.0.2-pts1.tar.gz
tar -xzvf nero2d-2.0.2-pts1.tar.gz && rm nero2d-2.0.2-pts1.tar.gz
mv nero2d-2.0.2/* ./ && rm -rf nero2d-2.0.2/
./configure
make -j $(nproc --all)
echo "#!/bin/bash
./src/nero2d ../../../inputs/nero2d.igf" > nero2d
chmod +x nero2d
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

echo "-------Downloading and installing hmmer"
mkdir hmmer && cd hmmer
wget http://www.phoronix-test-suite.com/benchmark-files/hmmer-2.3.2.tar.gz
tar -xzvf hmmer-2.3.2.tar.gz && rm hmmer-2.3.2.tar.gz
mv hmmer-2.3.2/* ./ && rm -rf hmmer-2.3.2/
./configure --enable-threads
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

echo "-------Downloading and installing rodinia"
mkdir rodinia && cd rodinia
wget http://www.cs.virginia.edu/~kw5na/lava/Rodinia/Packages/Current/rodinia_2.4.tar.bz2
tar -xvf rodinia_2.4.tar.bz2 && rm rodinia_2.4.tar.bz2
mv rodinia_2.4/* ./ && rm -rf rodinia_2.4/
cp data/cfd/missile.domn.0.2M ../../../inputs/missile.domn.0.2M
cd openmp/cfd && make && cp euler3d_cpu_double ../../ && cd ../
cd lavaMD && make && cp lavaMD ../../ && cd ../
cd streamcluster && make && cp sc_omp ../../
cd ../../
echo "#!/bin/bash
./\$*"> rodinia
chmod +x rodinia
cd ../

echo "-------Downloading and installing openssl"
mkdir openssl && cd openssl
wget http://www.openssl.org/source/old/1.0.1/openssl-1.0.1g.tar.gz
tar -xzvf openssl-1.0.1g.tar.gz && rm openssl-1.0.1g.tar.gz
mv openssl-1.0.1g/* ./ && rm -rf openssl-1.0.1g/
./config no-zlib
make
cp apps/openssl ./
cd ../

echo "-------Downloading and installing X264"
mkdir x264 && cd x264
wget http://download.videolan.org/pub/videolan/x264/snapshots/x264-snapshot-20180925-2245.tar.bz2
tar -xjf x264-snapshot-20180925-2245.tar.bz2 && rm x264-snapshot-20180925-2245.tar.bz2
mv x264-snapshot-20180925-2245/* ./ && rm -rf x264-snapshot-20180925-2245/
./configure --prefix=./ --disable-opencl  --enable-pic --enable-shared
make install
echo "#!/bin/bash
cd bin
./x264 ../../../../inputs/Bosphorus_1920x1080_120fps_420_8bit_YUV.y4m  -o /dev/null" > x264
chmod +x x264
cd ../

echo "-------Downloading and installing X265"
mkdir x265 && cd x265
wget http://bitbucket.org/multicoreware/x265/downloads/x265_3.1.2.tar.gz
tar -xzvf x265_3.1.2.tar.gz && rm x265_3.1.2.tar.gz
mv x265_3.1.2/* ./ && rm -rf x265_3.1.2/ && cd build
cmake ../source
make -j $(nproc --all)
cd ../
echo "#!/bin/bash
cd build
./x265 ../../../../inputs/Bosphorus_1920x1080_120fps_420_8bit_YUV.y4m  -o /dev/null" > x265
chmod +x x265
cd ../

echo "-------Downloading and installing build-linux-kernel"
mkdir build-linux-kernel && cd build-linux-kernel
cp ../../../inputs/linux-5.3.tar.gz ./
tar -xzvf linux-5.3.tar.gz && rm linux-5.3.tar.gz
echo "#!/bin/bash
cd linux-5.3/
yes \"\" | make oldconfig
make clean
sudo make -s -j \$(nproc --all)" > build-linux-kernel
chmod +x build-linux-kernel
cd ../

echo "-------Downloading and installing sysbench"
mkdir sysbench && cd sysbench
wget http://www.phoronix-test-suite.com/benchmark-files/sysbench-20180728.zip
unzip sysbench-20180728.zip && rm sysbench-20180728.zip
mv sysbench-master/* ./ && rm -rf sysbench-master/ 
./autogen.sh
./configure  --without-mysql
make -j $(nproc --all)
cp src/sysbench ./
cd ../

echo "-------Downloading and installing blake2s"
mkdir blake2s && cd blake2s
wget http://www.phoronix-test-suite.com/benchmark-files/BLAKE2-20170307.tar.xz
tar -xf BLAKE2-20170307.tar.xz && rm BLAKE2-20170307.tar.xz
mv BLAKE2-20170307/* ./ && rm -rf BLAKE2-20170307/
cp ../../$taskScripts/blake2s.c bench/bench.c
cd bench && make
cp blake2s ../
cd ../../

echo "-------Downloading and installing c-ray"
mkdir c-ray && cd c-ray
wget http://www.phoronix-test-suite.com/benchmark-files/c-ray-1.1.tar.gz
tar -xzvf c-ray-1.1.tar.gz && rm c-ray-1.1.tar.gz
mv c-ray-1.1/* ./ && rm -rf c-ray-1.1/
cc -o c-ray-mt c-ray-mt.c -lm -lpthread -O3
mv c-ray-mt c-ray
cd ../

echo "-------Downloading and installing blogbench"
mkdir blogbench && cd blogbench
wget http://download.pureftpd.org/pub/blogbench/blogbench-1.1.tar.gz
tar -xzvf blogbench-1.1.tar.gz && rm blogbench-1.1.tar.gz
mv blogbench-1.1/* ./ && rm -rf blogbench-1.1/
./configure
make -j $(nproc --all)
cp src/blogbench ./
cd ../

echo "-------Downloading and installing cachebench"
mkdir llbench && mkdir cachebench && cd llbench
wget http://www.phoronix-test-suite.com/benchmark-files/llcbench-20170104.tar.gz
tar -xzvf llcbench-20170104.tar.gz && rm llcbench-20170104.tar.gz
mv llcbench/* ./ && rm -rf llcbench/
cd cachebench
sed -i '.orig' '/#include <malloc.h>/d' cachebench.c
cp ../../../$taskScripts/cachebench.c ./
cd ../
make linux-mpich
make cache-bench
cp -r cachebench/* ../cachebench/
cd ../
rm -rf llbench

echo "-------Downloading and installing cloverleaf"
mkdir cloverleaf && cd cloverleaf
wget http://phoronix-test-suite.com/benchmark-files/CloverLeaf_OpenMP-20181012.zip
unzip CloverLeaf_OpenMP-20181012.zip && rm CloverLeaf_OpenMP-20181012.zip
mv CloverLeaf_OpenMP-master/* ./ && rm -rf CloverLeaf_OpenMP-master/
COMPILER=GNU make
cp InputDecks/clover_bm8192.in ../../../inputs
echo "#!/bin/bash
for i in {1..10}; do
    ./clover_leaf InputDecks/clover_bm8192.in
done" > cloverleaf
chmod +x cloverleaf
cd ../

echo "-------Downloading and installing brlcad"
mkdir brlcad && cd brlcad
wget https://iweb.dl.sourceforge.net/project/brlcad/BRL-CAD%20Source/7.28.0/brlcad-7.28.0.tar.bz2
tar -xf brlcad-7.28.0.tar.bz2 && rm brlcad-7.28.0.tar.bz2
mv brlcad-7.28.0/* ./ && rm -rf brlcad-7.28.0/
mkdir build && cd build
cmake .. -DBRLCAD_ENABLE_STRICT=NO -DBRLCAD_BUNDLED_LIBS=ON -DBRLCAD_OPTIMIZED_BUILD=ON -DCMAKE_BUILD_TYPE=Release
make -j $(nproc --all)
cd ../
echo "#!/bin/bash
./build/bench/benchmark run -P 8" > brlcad
chmod +x brlcad
cd ../

echo "-------Downloading and installing cpp-perf-bench"
mkdir cpp-perf-bench && cd cpp-perf-bench
wget http://phoronix-test-suite.com/benchmark-files/CppPerformanceBenchmarks-9.zip
unzip CppPerformanceBenchmarks-9.zip && rm CppPerformanceBenchmarks-9.zip
mv CppPerformanceBenchmarks-master/* ./ && rm -rf CppPerformanceBenchmarks-master/
make all
echo "#!/bin/bash
./\$1" > cpp-perf-bench
chmod + cpp-perf-bench
cd ../

echo "-------Downloading and installing dacapo"
mkdir dacapo && cd dacapo
wget https://downloads.sourceforge.net/project/dacapobench/9.12-bach-MR1/dacapo-9.12-MR1-bach.jar
mv dacapo-9-.12-MR1-bach.jar dacapo.jar
echo "#!/bin/bash
for j in {1..5}; do
	/usr/lib/jvm/java-8-openjdk-amd64/bin/java -jar dacapo.jar -t \$(nproc --all) --window 10 \$1
done
rm -rf scratch" > dacapo
chmod +x dacapo
cd ../

echo "-------Downloading and installing glibc-bench"
mkdir glibc-bench && cd glibc-bench
wget https://www.phoronix-test-suite.com/benchmark-files/glibc-benchmarks-2.tar.gz
tar -xvf glibc-benchmarks-2.tar.gz && rm glibc-benchmarks-2.tar.gz
mv glibc-benchmarks/* ./ && rm -rf glibc-benchmarks
echo "#!/bin/bash
./\$1" > glibc-bench
chmod +x glibc-bench
cd ../

echo "-------Downloading and installing ebizzy"
mkdir ebizzy && cd ebizzy
wget http://www.phoronix-test-suite.com/benchmark-files/ebizzy-0.3.tar.gz
tar -xzvf ebizzy-0.3.tar.gz && rm ebizzy-0.3.tar.gz
mv ebizzy-0.3/* ./ && rm -rf ebizzy-0.3
cc -pthread -lpthread -O3 -march=native -o ebizzy ebizzy.c
cd ../

echo "-------Downloading and installing himeno"
mkdir himeno && cd himeno
wget http://www.phoronix-test-suite.com/benchmark-files/himenobmtxpa-2.tar.xz
tar -xf himenobmtxpa-2.tar.xz && rm himenobmtxpa-2.tar.xz
cc himenobmtxpa.c -O3 -mavx2 -o himeno
cd ../

echo "-------Downloading and installing hint"
mkdir hint && cd hint
wget http://www.phoronix-test-suite.com/benchmark-files/hint-1.0.tar.gz
tar -xzvf hint-1.0.tar.gz && rm hint-1.0.tar.gz
mv unix/* ./ && rm -rf unix
cc -O3 -march=native hint.c hkernel.c -Dunix -DDOUBLE -DIINT -o double -lm
cc -O3 -march=native hint.c hkernel.c -Dunix -DFLOAT -DIINT -o float -lm
echo "#!/bin/bash
./\$1" > hint
chmod +x hint
cd ../

echo "-------Downloading and installing john-the-ripper"
mkdir john-the-ripper && cd john-the-ripper
wget https://www.openwall.com/john/k/john-1.9.0-jumbo-1.tar.gz
tar -zxvf john-1.9.0-jumbo-1.tar.gz && rm john-1.9.0-jumbo-1.tar.gz
mv john-1.9.0-jumbo-1/* ./ && rm -rf john-1.9.0-jumbo-1
cd src/
CFLAGS="-O3 -march=native -std=gnu89" ./configure --disable-native-tests --disable-opencl
CFLAGS="-O3 -march=native -std=gnu89" make -j $(nproc --all)
cd ../
echo "#!/bin/bash
cd run/
./john --test=30 --format=\$1" > john-the-ripper
chmod +x john-the-ripper
cd ../

echo "-------Downloading and installing lzbench"
mkdir lzbench && cd lzbench
wget http://www.phoronix-test-suite.com/benchmark-files/lzbench-20170808.zip
unzip lzbench-20170808.zip && rm lzbench-20170808.zip
mv lzbench/* ./ && rm -rf lzbench/
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
g++ -fopenmp $CFLAGS main.c -o m-queens
cd ../

echo "-------Downloading and installing mbw"
mkdir mbw && cd mbw
wget http://www.phoronix-test-suite.com/benchmark-files/mbw-20180908.tar.xz
tar -xf mbw-20180908.tar.xz && rm mbw-20180908.tar.xz
mv mbw/* ./ && rm -rf mbw
cc -O3 -march=native -o mbw mbw.c
cd ../

echo "-------Downloading and installing mcperf"
mkdir mcperf && cd mcperf
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/twemperf/mcperf-0.1.1.tar.gz
tar -xzvf mcperf-0.1.1.tar.gz && rm mcperf-0.1.1.tar.gz
mv mcperf-0.1.1/* ./ && rm -rf mcperf-0.1.1
./configure
make
echo "#!/bin/bash
cd src/
./mcperf --linger=0 --call-rate=0 --num-calls=2000000 --conn-rate=0 --num-conns=1 --sizes=d5120 --method=\$1" > mcperf
chmod +x mcperf
cd ../

echo "-------Downloading and installing mkl-dnn"
mkdir mkl-dnn && cd mkl-dnn
wget https://github.com/intel/mkl-dnn/archive/v1.1.tar.gz
tar -xf v1.1.tar.gz && rm v1.1.tar.gz
mv mkl-dnn-1.1/* ./ && rm -rf mkl-dnn-1.1/
mkdir build && cd build
CFLAGS="-O3 -march=native" CXXFLAGS="-O3 -march=native" cmake -DCMAKE_BUILD_TYPE=Release MKLDNN_ARCH_OPT_FLAGS="-O3 -march=native" $CMAKE_OPTIONS ..
make -j $(nproc --all)
cd ../
echo "#!/bin/bash
cd build/tests/benchdnn
./benchdnn --mode=p --\$2 --batch=inputs/\$2/\$1" > mkl-dnn
chmod +x mkl-dnn
cd ../

echo "-------Downloading and installing node-express-loadtest"
mkdir node-express-loadtest && cd node-express-loadtest
wget http://phoronix-test-suite.com/benchmark-files/NodeRestPerfTest3-20181001.zip
unzip NodeRestPerfTest3-20181001.zip && rm NodeRestPerfTest3-20181001.zip
export TZ=EST
mv NodeRestPerfTest3-master/* ./ && rm -rf NodeRestPerfTest3-master/
npm i express
npm i loadtest
echo "#!/bin/bash
node expressserver.js &
task=\$!
./node_modules/loadtest/bin/loadtest.js  -n 100000 -c 250 http://localhost:8000
kill -9 \$task" > node-express-loadtest
chmod +x node-express-loadtest
cd ../

echo "-------Downloading and installing numenta-nab"
mkdir numenta-nab && cd numenta-nab
wget http://phoronix-test-suite.com/benchmark-files/NAB-20181109.tar.xz
tar -xf NAB-20181109.tar.xz && rm NAB-20181109.tar.xz
mv NAB-master/* ./ && rm -rf NAB-master/
pip install . --user
pip install pandas
pip install nupic
echo "#!/bin/bash
python run.py -d numenta --detect --skipConfirmation --score" > numenta-nab
chmod +x numenta-nab
cd ../

echo "-------Downloading and installing phpbench"
mkdir phpbench && cd phpbench
wget http://phoronix-test-suite.com/benchmark-files/phpbench-081-patched1.zip
unzip phpbench-081-patched1.zip && rm phpbench-081-patched1.zip
mv phpbench-0.8.1-patched1/* ./ && rm -rf phpbench-0.8.1-patched1/
echo "#!/bin/bash
\$@" > phpbench
chmod +x phpbench
cd ../

echo "-------Downloading and installing primesieve"
mkdir primesieve && cd primesieve
wget http://dl.bintray.com/kimwalisch/primesieve/primesieve-7.4.tar.gz
tar -xzvf primesieve-7.4.tar.gz && rm primesieve-7.4.tar.gz
mv primesieve-7.4/* ./ && rm -rf primesieve-7.4/
cmake . -DBUILD_SHARED_LIBS=OFF
make -j $(nproc --all)
cd ../

echo "-------Downloading and installing pymongo"
mkdir pymongo && cd pymongo
python -m pip install pymongo
cp ../../$taskScripts/pymongoInsert.py ./
echo "#!/bin/bash
python pymongoInsert.py" > pymongo
chmod +x pymongo
cd ../

echo "-------Downloading and installing rbenchmark"
mkdir rbenchmark && cd rbenchmark
wget http://www.phoronix-test-suite.com/benchmark-files/rbenchmarks-20160105.tar.bz2
tar -xjvf rbenchmarks-20160105.tar.bz2 && rm rbenchmarks-20160105.tar.bz2
mv rbenchmarks/* ./ && rm -rf rbenchmarks/
echo "#!/bin/bash
Rscript R-benchmark-25/R-benchmark-25.R" > rbenchmark
chmod +x rbenchmark
cd ../

echo "-------Downloading and installing redis"
mkdir redis && cd redis
wget http://download.redis.io/releases/redis-5.0.5.tar.gz
tar -xzvf redis-5.0.5.tar.gz && rm redis-5.0.5.tar.gz
mv redis-5.0.5/* ./ && rm -rf redis-5.0.5/
cd deps/
make hiredis jemalloc linenoise lua
cd ../
make MALLOC=libc -j $(nproc --all)
echo "#!/bin/bash
running=`ps -aux | grep redis | wc -l`
if [ \$running -ne 2 ]; then
	src/redis-server &
fi
src/redis-benchmark -n 1000000 -P 640000 -q -c 50 --csv \$1" > redis
chmod +x redis 
cd ../

echo "-------Downloading and installing rust-prime"
mkdir rust-prime && cd rust-prime
wget http://phoronix-test-suite.com/benchmark-files/Prime-Benchmark-20181001.zip
unzip Prime-Benchmark-20181001.zip && rm Prime-Benchmark-20181001.zip
mv Prime-Benchmark-master/* ./ && rm -rf Prime-Benchmark-master/
RUSTFLAGS="-C target-cpu=native" rustc rust/main.rs -C opt-level=3 -o rust-prime
cd ../

echo "-------Downloading and installing scikit"
mkdir scikit && cd scikit
wget https://github.com/scikit-learn/scikit-learn/archive/0.22.1/scikit-learn-0.22.1.tar.gz
tar -xzvf scikit-learn-0.22.1.tar.gz && rm scikit-learn-0.22.1.tar.gz
mv scikit-learn-0.22.1/* ./ && rm -rf scikit-learn-0.22.1/
pip3 install numpy
pip3 install scipy
pip install sklearn
echo "#!/bin/bash
python3 benchmarks/bench_random_projections.py --n-times 20" > scikit
chmod +x scikit
cd ../

echo "-------Downloading and installing stress-ng"
mkdir stress-ng && cd stress-ng
wget http://www.phoronix-test-suite.com/benchmark-files/stress-ng-0.07.26.tar.gz
tar -xzvf stress-ng-0.07.26.tar.gz && rm stress-ng-0.07.26.tar.gz
mv stress-ng-0.07.26/* ./ && rm -rf stress-ng-0.07.26/
make -j $(nproc --all)
cd ../

echo "-------Downloading and installing stream"
mkdir stream && cd stream
wget http://www.phoronix-test-suite.com/benchmark-files/stream-2013-01-17.tar.bz2
tar -xjvf stream-2013-01-17.tar.bz2 && rm stream-2013-01-17.tar.bz2
cc stream.c -DSTREAM_ARRAY_SIZE=100000000 -DNTIMES=100 -O3 -fopenmp -o stream
cd ../

echo "-------Downloading and installing swet"
mkdir swet && cd swet
wget http://www.phoronix-test-suite.com/benchmark-files/swet-1.5.16-src.tar.gz
tar -xzvf swet-1.5.16-src.tar.gz && rm swet-1.5.16-src.tar.gz
mv swet1/* ./ && rm -rf swet1
./configure
make
cd ../

echo "-------Downloading and installing t-test1"
mkdir t-test1 && cd t-test1
wget http://phoronix-test-suite.com/benchmark-files/t-test1c-20171.zip
unzip t-test1c-20171.zip && rm t-test1c-20171.zip
cc -pthread -O3 -o t-test1 t-test1.c
cd ../

echo "-------Downloading and installing tensorflow"
mkdir tensorflow && cd tensorflow
wget http://www.phoronix-test-suite.com/benchmark-files/cifar10_tf.tar.gz
tar -axf cifar10_tf.tar.gz && rm cifar10_tf.tar.gz
mv cifar10/* ./ && rm -rf cifar10
pip3 install tensorflow
echo "#!/bin/bash
python3 cifar10_train.py --max_steps 400" > tensorflow
chmod +x tensorflow
cd ../

echo "-------Downloading and installing tinymembench"
mkdir tinymembench && cd tinymembench
wget http://phoronix-test-suite.com/benchmark-files/tinymembench-20180528.zip
unzip tinymembench-20180528.zip && rm tinymembench-20180528.zip
mv tinymembench-master/* ./ && rm -rf tinymembench-master
make
cd ../

echo "-------Downloading and installing xsbench"
mkdir xsbench && cd xsbench
wget http://phoronix-test-suite.com/benchmark-files/XSBench-20170808.zip
unzip XSBench-20170808.zip && rm XSBench-20170808.zip
mv XSBench-master/* ./ && rm -rf XSBench-master/
cd src/ && make && cp XSBench ../xsbench
cd ../../

echo "-------Downloading and installing ttsiod-renderer"
mkdir ttsiod-renderer && cd ttsiod-renderer
wget http://www.phoronix-test-suite.com/benchmark-files/renderer-2.3b.zip
unzip renderer-2.3b.zip && rm renderer-2.3b.zip
mv renderer-2.3b/* ./ && rm -rf renderer-2.3b/
./configure
make -j $(nproc --all)
echo "#!/bin/bash
cd 3D-Objects
OMP_NUM_THREADS=\$(nproc --all) SDL_VIDEODRIVER=dummy ../src/renderer -b -n 10000 statue.ply" > ttsiod-renderer
chmod +x ttsiod-renderer
cd ../

echo "-------Downloading and installing botan"
mkdir botan && cd botan
wget http://botan.randombit.net/releases/Botan-2.8.0.tgz
tar -xf Botan-2.8.0.tgz && rm Botan-2.8.0.tgz
mv Botan-2.8.0/* ./ && rm -rf Botan-2.8.0 
python3 ./configure.py
make -j $(nproc --all)
mv botan botan_bin
echo "#!/bin/bash
./botan_bin speed \$1 --format=table --msec=10000" > botan
chmod +x botan
cd ../

echo "-------Downloading and installing build-gcc"
mkdir build-gcc && cd build-gcc
wget ftp://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-8.2.0/gcc-8.2.0.tar.gz
tar -xzvf gcc-8.2.0.tar.gz && rm -rf 
mv gcc-8.2.0/* ./ && rm -rf gcc-8.2.0
echo "#!/bin/bash
./contrib/download_prerequisites
./configure --disable-multilib --enable-checking=release
make defconfig
make clean
make -s -j \$(nproc --all)" > build-gcc
chmod +x build-gcc
cd ../

echo "-------Downloading and installing build-llvm"
mkdir build-llvm && cd build-llvm
wget http://releases.llvm.org/6.0.1/llvm-6.0.1.src.tar.xz
tar -xf llvm-6.0.1.src.tar.xz && rm llvm-6.0.1.src.tar.xz
mv llvm-6.0.1.src/* ./ && rm -rf llvm-6.0.1.src/ 
echo "#!/bin/bash
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE:STRING=Release ../
make -s -j \$(nproc --all)" > build-llvm
chmod +x build-llvm
cd ../

echo "-------Downloading and installing javascimark2"
mkdir javascimark2 && cd javascimark2
wget http://math.nist.gov/scimark2/scimark2lib.zip
unzip scimark2lib.zip && rm scimark2lib.zip
echo "#!/bin/sh
java jnt.scimark2.commandline
echo \$? > ~/test-exit-status" > javascimark2
chmod +x javascimark2
cd ../

echo "-------Downloading and installing sunflow"
mkdir sunflow && cd sunflow
wget  http://ufpr.dl.sourceforge.net/sourceforge/sunflow/sunflow-bin-v0.07.2.zip
unzip sunflow-bin-v0.07.2.zip && rm sunflow-bin-v0.07.2.zip
mv sunflow/* ./ && rm -rf sunflow
echo "#!/bin/sh
cd sunflow
if [ \$SYS_MEMORY -ge 1280 ] ; then
	JAVA_VM_MEMORY=1024M
elif [ \$SYS_MEMORY -ge 768 ] ; then
	JAVA_VM_MEMORY=512M
else
	JAVA_VM_MEMORY=256M
fi
java -server -Xmx\$JAVA_VM_MEMORY -jar sunflow.jar -bench 2>&1" > sunflow
chmod +x sunflow
cd ../

echo "-------Downloading and installing sqlitebench"
mkdir sqlitebench && cd sqlitebench
wget  http://sqlite.org/2019/sqlite-autoconf-3300100.tar.gz
tar -xzvf sqlite-autoconf-3300100.tar.gz && rm sqlite-autoconf-3300100.tar.gz
mv sqlite-autoconf-3300100/* ./ && rm -rf sqlite-autoconf-3300100/
wget http://www.phoronix-test-suite.com/benchmark-files/pts-sqlite-tests-1.tar.gz
tar -xzvf pts-sqlite-tests-1.tar.gz && rm pts-sqlite-tests-1.tar.gz
./configure --prefix=`pwd`
make -j $(nproc --all)
make install
echo "#!/bin/sh
rm benchmark.db
bin/sqlite3 benchmark.db  \"CREATE TABLE pts1 ('I' SMALLINT NOT NULL, 'DT' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 'F1' VARCHAR(4) NOT NULL, 'F2' VARCHAR(16) NOT NULL);\"
cat sqlite-2500-insertions.txt | bin/sqlite3 benchmark.db" > sqlitebench
chmod +x sqlitebench
cd ../

echo "-------Downloading and installing iozone"
mkdir iozone && cd iozone
wget http://iozone.org/src/current/iozone3_465.tar
tar -xf iozone3_465.tar && rm iozone3_465.tar
mv iozone3_465/* ./ && rm -rf iozone3_465
cd src/current/
make linux
cp iozone ../../
cd ../../../

echo "-------Downloading and installing dbench"
mkdir dbench && cd dbench
wget http://samba.org/ftp/tridge/dbench/dbench-4.0.tar.gz
tar -xf dbench-4.0.tar.gz && rm dbench-4.0.tar.gz
mv dbench-4.0/* ./ && rm -rf dbench-4.0
./autogen.sh
./configure --prefix=`pwd`
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
cc -O3 postmark-1.51.c -o postmark
cp ../../${taskScripts}/postmark.pmrc ./
cd ../

echo "-------Downloading and installing fs-mark"
mkdir fs-mark && cd fs-mark
wget http://www.phoronix-test-suite.com/benchmark-files/fs_mark-3.3.tar.gz
tar -xzvf fs_mark-3.3.tar.gz && rm fs_mark-3.3.tar.gz
mv fs_mark-3.3/* ./ && rm -rf fs_mark-3.3/
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

echo "-------Downloading and installing bork"
mkdir bork && cd bork
wget http://www.phoronix-test-suite.com/benchmark-files/bork-1.4.zip
unzip bork-1.4.zip && rm bork-1.4.zip
mv bork-1.4/* ./ && rm -rf bork-1.4/
echo "#!/bin/bash
dd if=/dev/zero of=encryptfile bs=2048 count=1048576
BORK_PASSWORD=phoronixtestsuite123 ./bork.sh ./encryptfile
rm -f encryptfile.bork
rm -f encryptfile" > bork
chmod +x bork
cd ../

echo "-------Downloading and installing ffmpeg"
mkdir ffmpeg && cd ffmpeg
wget http://ffmpeg.org/releases/ffmpeg-4.0.2.tar.bz2
tar -xjvf ffmpeg-4.0.2.tar.bz2 && rm ffmpeg-4.0.2.tar.bz2
mv ffmpeg-4.0.2/* ./ && rm -rf ffmpeg-4.0.2/
wget http://samples.ffmpeg.org/V-codecs/h264/HD2-h264.ts
./configure --disable-zlib --disable-doc --prefix=`pwd`
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
./configure --prefix=`pwd` --enable-expopt=full
make
make install
wget https://www.phoronix.net/downloads/phoronix-test-suite/benchmark-files/pts-trondheim-wav-3.tar.gz
tar -xzvf pts-trondheim-wav-3.tar.gz && rm pts-trondheim-wav-3.tar.gz
echo "#!/bin/bash
./bin/lame -h pts-trondheim-3.wav" > encode-mp3
chmod +x encode-mp3
cd ../

echo "-------Downloading and installing encode-flac"
mkdir encode-flac && cd encode-flac
wget https://www.phoronix.net/downloads/phoronix-test-suite/benchmark-files/pts-trondheim-wav-3.tar.gz
tar -xzvf pts-trondheim-wav-3.tar.gz && rm pts-trondheim-wav-3.tar.gz
echo "#!/bin/bash
for i in {1..10}; do
flac --best pts-trondheim-3.wav -f -o output
done" > encode-flac
chmod +x encode-flac
cd ../

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
git clone https://github.com/facebook/rocksdb
mv rocksdb/* ./ && rm -rf rocksdb
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

echo "-------Downloading and installing cassandra"
git clone https://github.com/apache/cassandra.git && cd cassandra
ant
echo "#!/bin/bash
cd bin/
./cassandra -f -R &
CASSANDRA_SERVER_PID=\$!
sleep 10
cd ../tools/bin
case \"\$1\" in
\"write\")
	./cassandra-stress write n=400K -rate threads=\$(nproc --all) ;;
\"read\")
	./cassandra-stress write -rate threads=\$(nproc --all)
	sleep 2
	./cassandra-stress read n=400K -rate threads=\$(nproc --all) ;;
\"mixed_1_1\")
	./cassandra-stress write -rate threads=\$(nproc --all)
	sleep 2
	./cassandra-stress mixed ratio\(write=1,read=1\) n=400K -rate threads=\$(nproc --all) ;;
\"mixed_1_3\")
	./cassandra-stress write -rate threads=\$(nproc --all)
	sleep 2
	./cassandra-stress mixed ratio\(write=1,read=3\) n=400K -rate threads=\$(nproc --all);;
esac
kill \$CASSANDRA_SERVER_PID
sleep 3" > cassandra
chmod +x cassandra
cd ../

echo "-------Downloading and installing compilebench"
mkdir compilebench && cd compilebench
wget http://www.phoronix-test-suite.com/benchmark-files/compilebench-0.6.tar.bz2
tar -xjvf compilebench-0.6.tar.bz2 && rm compilebench-0.6.tar.bz2
mv compilebench-0.6/* ./ && rm -rf compilebench-0.6
mv compilebench compile-bench
echo "#!/bin/sh
python2 compile-bench -D t -i 10 --makej \$1" > compilebench
chmod +x compilebench
cd ../

echo "-------Downloading and installing smallpt"
mkdir smallpt && cd smallpt
wget http://www.phoronix-test-suite.com/benchmark-files/smallpt-1.tar.gz
tar -xzvf smallpt-1.tar.gz && rm smallpt-1.tar.gz
c++ -fopenmp -O3 smallpt.cpp -o smallpt
cd ../

echo "-------Downloading and installing build-php"
mkdir build-php && cd build-php
wget http://mirror.cogentco.com/pub/php/php-7.4.2.tar.bz2
tar -xjvf php-7.4.2.tar.bz2 && rm php-7.4.2.tar.bz2
mv php-7.4.2/* ./ && rm -rf php-7.4.2/
echo "#!/bin/bash
make clean
./configure --without-sqlite3 --without-pdo-sqlite
make -s -j $(nproc --all)" > build-php
chmod +x build-php
cd ../

echo "-------Downloading and installing inkscape"
mkdir inkscape && cd inkscape
wget http://phoronix-test-suite.com/benchmark-files/svg-test-files-1.zip
unzip svg-test-files-1.zip && rm svg-test-files-1.zip
echo "#!/bin/sh
for i in *.svg; do
    inkscape -z -e output.png \$i
done" > inkscape
chmod +x inkscape
cd ../

echo "-------Downloading and installing rawtherapee"
mkdir rawtherapee && cd rawtherapee
wget http://www.phoronix-test-suite.com/benchmark-files/benchmarkRT-2.tar.xz
tar -xf benchmarkRT-2.tar.xz && rm benchmarkRT-2.tar.xz
mv benchmarkRT/benchmarkRT ./benchmarkRT_bin && rm -rf benchmarkRT
mv benchmarkRT_bin benchmarkRT
echo "#!/bin/sh
RT_CLI=\`which rawtherapee-cli\`
RT_PATH=\`dirname \$RT_CLI\`
./benchmarkRT -e \$RT_PATH -a \$@" > rawtherapee
chmod +x rawtherapee
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
cmake ..
make -j $(nproc --all)
cd ..
echo "#!/bin/sh
./build/tjbench jpeg-test-1.JPG -nowrite
./build/tjbench jpeg-test-2.JPG -nowrite
./build/tjbench jpeg-test-3.JPG -nowrite
./build/tjbench jpeg-test-4.JPG -nowrite" > tjbench
chmod +x tjbench
cd ../

echo "-------Downloading and installing darktable"
mkdir darktable && cd darktable
wget http://www.phoronix-test-suite.com/benchmark-files/darktable-bench-assets-1.tar.bz2
tar -xjvf darktable-bench-assets-1.tar.bz2 && rm darktable-bench-assets-1.tar.bz2
wget http://www.phoronix-test-suite.com/benchmark-files/server-rack.tar.xz
tar -xf server-rack.tar.xz && rm server-rack.tar.xz
echo "#!/bin/sh
rm -f output*.jpg
darktable-cli \$1 output.jpg --core -d perf --disable-opencl" > darktable
chmod +x darktable
cd ../

echo "-------Downloading and installing rsvg"
mkdir rsvg && cd rsvg
wget https://www.w3.org/Graphics/SVG/Test/20110816/archives/W3C_SVG_11_TestSuite.tar.gz
tar -xzvf W3C_SVG_11_TestSuite.tar.gz && rm W3C_SVG_11_TestSuite.tar.gz
wget http://phoronix-test-suite.com/benchmark-files/svg-test-files-1.zip
unzip svg-test-files-1.zip && rm svg-test-files-1.zip
cp svg/* ./ && rm -rf svg
echo "#!/bin/sh
for i in *.svg
do
	rsvg-convert -f png -o output.png \$i
done" > rsvg
chmod +x rsvg
cd ../

echo "-------Downloading and installing gegl"
mkdir gegl && cd gegl
wget http://phoronix-test-suite.com/benchmark-files/sample-photo-6000x4000-1.zip
unzip sample-photo-6000x4000-1.zip && rm sample-photo-6000x4000-1.zip
wget http://www.phoronix-test-suite.com/benchmark-files/stock-photos-jpeg-2018-1.tar.xz
tar -xf stock-photos-jpeg-2018-1.tar.xz && rm stock-photos-jpeg-2018-1.tar.xz
wget http://www.phoronix-test-suite.com/benchmark-files/pts-sample-photos-2.tar.bz2
tar -xf pts-sample-photos-2.tar.bz2 && rm pts-sample-photos-2.tar.bz2
echo "#!/bin/sh
for i in *.JPG
do 
    gegl -i \$i -o out.png -- \$@
done" > gegl
chmod +x gegl
cd ../

echo "-------Downloading and installing renaissance"
mkdir renaissance && cd renaissance
wget https://github.com/renaissance-benchmarks/renaissance/releases/download/v0.9.0/renaissance-mit-0.9.0.jar
echo "#!/bin/sh
java -jar renaissance-mit-0.9.0.jar -r 1 \$1" > renaissance
chmod +x renaissance
cd ../

echo "-------Downloading and installing java-jmh"
mkdir java-jmh && cd java-jmh
mvn archetype:generate \
          -DinteractiveMode=false \
          -DarchetypeGroupId=org.openjdk.jmh \
          -DarchetypeArtifactId=jmh-java-benchmark-archetype \
          -DgroupId=org.sample \
          -DartifactId=test \
          -Dversion=1.0
cd test
mvn clean install
cd ../
echo "#!/bin/sh
cd test
java -jar target/benchmarks.jar -t max" > java-jmh
chmod +x java-jmh
cd ../

echo "-------Downloading and installing schbench"
mkdir schbench && cd schbench
wget http://phoronix-test-suite.com/benchmark-files/schbench-20180206.zip
unzip schbench-20180206.zip && rm schbench-20180206.zip
mv schbench/* ./ && rm -rf schbench/ 
make
mv schbench schbench-bin
echo "#!/bin/sh
./schbench-bin -m \$1 -t \$(nproc --all) " > schbench
chmod +x schbench
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

echo "-------Downloading and installing tiobench"
mkdir tiobench && cd tiobench
wget http://phoronix-test-suite.com/benchmark-files/tiobench-20170504.tar.bz2
tar -xjvf tiobench-20170504.tar.bz2 && rm tiobench-20170504.tar.bz2
mv tiobench-20170504/* ./ && rm -rf tiobench-20170504
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
done"  > tiobench
chmod +x tiobench
cd ../

echo "-------Downloading and installing pybench"
mkdir pybench && cd pybench
wget http://www.phoronix-test-suite.com/benchmark-files/pybench-2018-02-16.tar.gz
tar -xzvf pybench-2018-02-16.tar.gz && rm pybench-2018-02-16.tar.gz
mv pybench-2018-02-16/* ./ && rm -rf pybench-2018-02-16
echo "#!/bin/bash
python3 pybench.py -n 20\$@" > pybench
chmod +x pybench
cd ../

echo "-------Downloading and installing network-loopback"
mkdir network-loopback && cd network-loopback
echo "#!/bin/bash
nc -d -l 9999 > /dev/null &
sleep 3
dd if=/dev/zero bs=1M count=100000 | nc -w 3 localhost 9999" > network-loopback
chmod +x network-loopback
cd ../

echo "-------Downloading and installing svt-vp9"
git clone https://github.com/OpenVisualCloud/SVT-VP9.git
mv SVT-VP9 svt-vp9 && cd svt-vp9
cd Build/linux/
./build.sh release
cd ../../
echo "#!/bin/bash
case \$1 in 
    (\"tune_0\")
        tuning=\"tune 0\";;
    (\"tune_1\")
        tuning=\"tune 1\";;
    (\"tune_2\")
        tuning=\"tune 1\";;
esac
for i in {1..10}; do
    ./Bin/Release/SvtVp9EncApp -i ../../../inputs/Bosphorus_1920x1080_120fps_420_8bit_YUV.y4m  -w 1920 -h 1080 \$tuning
done" > svt-vp9
chmod +x svt-vp9
cd ../

echo "-------Downloading and installing svt-hevc"
git clone https://github.com/OpenVisualCloud/SVT-HEVC.git
mv SVT-HEVC svt-hevc && cd svt-hevc
mkdir build
cd build
cmake ..
make -j $(nproc --all)
cd ../
echo "#!/bin/bash
./Bin/Release/SvtHevcEncApp -encMode 5 -i ../../../inputs/Bosphorus_1920x1080_120fps_420_8bit_YUV.y4m -w 1920 -h 1080" > svt-hevc
chmod +x svt-hevc
cd ../

echo "-------Downloading and installing tungsten"
mkdir tungsten && cd tungsten
wget http://phoronix-test-suite.com/benchmark-files/tungsten-20190812.zip
unzip tungsten-20190812.zip && rm tungsten-20190812.zip
mv tungsten-master/* ./ && rm -rf tungsten-master
./setup_builds.sh
cd build/release
make -j $(nproc --all)
cd ../../
echo "#!/bin/bash
cd build/release
./tungsten -t \$(nproc --all) ../../data/example-scenes/\$1/scene.json" > tungsten
chmod +x tungsten
cd ../

echo "-------Downloading and installing ospray"
mkdir ospray && cd ospray
wget http://github.com/ospray/ospray/releases/download/v1.8.5/ospray-1.8.5.x86_64.linux.tar.gz
tar -xzvf ospray-1.8.5.x86_64.linux.tar.gz && rm ospray-1.8.5.x86_64.linux.tar.gz
wget http://www.sdvis.org/ospray/download/demos/sanm.zip
unzip sanm.zip && rm sanm.zip
wget http://www.pauldebevec.com/Probes/rnl_probe.pfm
wget http://www.sdvis.org/ospray/download/demos/MagneticReconnection/magnetic-512-volume.tar.bz2
tar -xjvf magnetic-512-volume.tar.bz2 && rf magnetic-512-volume.tar.bz2
wget http://www.sdvis.org/ospray/download/demos/XFrogForest/xfrog-forest.tar.bz2
tar -xjvf xfrog-forest.tar.bz2 && rm xfrog-forest.tar.bz2
mv ospray-1.8.5.x86_64.linux/* ./ && rm -rf ospray-1.8.5.x86_64.linux
echo "#!/bin/bash
case \$1 in
    (\"magnetic_reconnection\")
        testCase=\"magnetic-512-volume/magnetic-512-volume.osp\";;
    (\"xfrog_forest\")
        testCase=\"xfrog-forest.xml\";;
    (\"san_miguel\")
        testCase=\"sanm/sanm.obj -vp 22.958788 3.204613 2.712676 \
        -vu 0.000000 1.000000 0.000000 -vi 12.364944 0.176316 4.009342 \
        -sg:sun:intensity=4.0 -sg:sun:direction=0,-1,0 -sg:bounce:intensity=0.0 \
        --hdri-light rnl_probe.pfm -sg:hdri:intensity=1.25\";;
esac
./bin/ospBenchmark --warmup 10 --bench 200 --osp:numthreads \$(nproc --all) --renderer scivis \$testCase" > ospray
chmod +x ospray
cd ../

echo "-------Downloading and installing embree"
mkdir embree && cd embree
wget https://github.com/embree/models/releases/download/release/asian_dragon.zip
unzip asian_dragon.zip && rm asian_dragon.zip
wget https://github.com/embree/models/releases/download/release/asian_dragon_obj.zip
unzip asian_dragon_obj.zip && rf asian_dragon_obj.zip
wget https://github.com/embree/models/releases/download/release/crown.zip
unzip crown.zip && rm crown.zip
wget https://github.com/embree/embree/releases/download/v3.6.1/embree-3.6.1.x86_64.linux.tar.gz
tar -xzvf embree-3.6.1.x86_64.linux.tar.gz && rm -rf embree-3.6.1.x86_64.linux.tar.gz
mv embree-3.6.1.x86_64.linux/* ./ && rm -rf embree-3.6.1.x86_64.linux
echo "#!/bin/bash
case \$1 in
    (\"asian_dragon\")
        testCase=\"asian_dragon/asian_dragon.ecs\";;
    (\"asian_dragon_obj\")
        testCase=\"asian_dragon_obj/asian_dragon.ecs\";;
    (\"crown\")
        testCase=\"crown/crown.ecs\";;
esac
./bin/pathtracer --threads \$(nproc --all) -benchmark 0 600 -c \$testCase" > embree
chmod +x embree
cd ../

echo "-------Downloading and installing iperf"
mkdir iperf && cd iperf
wget https://downloads.es.net/pub/iperf/iperf-3.7.tar.gz
tar -xzvf iperf-3.7.tar.gz && rm iperf-3.7.tar.gz
mv iperf-3.7/* ./ && rm -rf iperf-3.7
./configure --prefix=`pwd` CFLAGS="-O3 -march=native"
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

echo "-------Downloading and installing oidn"
mkdir oidn && cd oidn
wget https://github.com/OpenImageDenoise/oidn/releases/download/v1.0.0/oidn-1.0.0.x86_64.linux.tar.gz
tar -xzvf oidn-1.0.0.x86_64.linux.tar.gz && rm oidn-1.0.0.x86_64.linux.tar.gz
mv oidn-1.0.0.x86_64.linux/* ./ && rm -rf oidn-1.0.0.x86_64.linux
wget http://www.pauldebevec.com/Research/HDR/memorial.pfm
mv memorial.pfm bin/
echo "#!/bin/sh
cd bin/
./denoise -out out.pfm -bench 100 -threads \$(nproc --all) -hdr memorial.pfm" > oidn
chmod +x oidn
cd ../

echo "-------Downloading and installing pyperformance"
mkdir pyperformance-run && cd pyperformance-run
wget https://github.com/python/pyperformance/archive/1.0.0.zip
unzip 1.0.0.zip && rm 1.0.0.zip
mv pyperformance-1.0.0/* ./ && rm -rf pyperformance-1.0.0
pip3 install pyperformance
python3 setup.py build
python3 setup.py install --user
echo "#!/bin/bash
~/.local/bin/pyperformance run -r -b \$1" > pyperformance-run
chmod +x pyperformance-run
cd ../

echo "-------Downloading and installing rays1bench"
mkdir rays1bench && cd rays1bench
wget http://phoronix-test-suite.com/benchmark-files/rays1bench-20200109.zip
unzip rays1bench-20200109.zip && rm rays1bench-20200109.zip
mv rays1bench-master/* ./ && rm -rf rays1bench-master
python3 bench.py --latest --compile-only
echo "#!/bin/bash
python3 bench.py  --latest" > rays1bench
chmod +x rays1bench
cd ../

echo "-------Downloading and installing cp2k"
mkdir cp2k && cd cp2k
wget https://github.com/cp2k/cp2k/releases/download/v6.1.0/cp2k-6.1.tar.bz2
tar -xjvf cp2k-6.1.tar.bz2 && rm cp2k-6.1.tar.bz2
wget https://github.com/cp2k/cp2k/releases/download/v6.1.0/cp2k-6.1-Linux-x86_64.ssmp
chmod +x cp2k-6.1-Linux-x86_64.ssmp
mv cp2k-6.1/* ./ && rm -rf cp2k-6.1
echo "#!/bin/bash
./cp2k-6.1-Linux-x86_64.ssmp -i tests/Fist/benchmark/fayalite.inp" > cp2k
chmod +x cp2k
cd ../

echo "-------Downloading and installing svt-av1"
git clone https://github.com/OpenVisualCloud/SVT-AV1.git
mv SVT-AV1 svt-av1 && cd svt-av1 
cd Build/linux/
./build.sh release
cd ../../
echo "#!/bin/sh
./Bin/Release/SvtAv1EncApp enc-mode 8 -n 320 -i ../../../inputs/Bosphorus_1920x1080_120fps_420_8bit_YUV.y4m -w 1920 -h 1080" > svt-av1
chmod +x svt-av1
cd ../

echo "-------Downloading and installing dav1d"
mkdir dav1d && cd dav1d
wget http://ffmpeg.org/releases/ffmpeg-4.2.1.tar.bz2
tar -xjvf ffmpeg-4.2.1.tar.bz2 && rm ffmpeg-4.2.1.tar.bz2
wget http://downloads.videolan.org/pub/videolan/dav1d/0.5.0/dav1d-0.5.0.tar.xz
tar -xf dav1d-0.5.0.tar.xz && rm dav1d-0.5.0.tar.xz
wget http://www.elecard.com/storage/video/Stream2_AV1_HD_6.8mbps.webm
wget http://www.elecard.com/storage/video/Stream2_AV1_4K_22.7mbps.webm
wget http://download.opencontent.netflix.com.s3.amazonaws.com/AV1/Chimera/Old/Chimera-AV1-8bit-1920x1080-6736kbps.mp4
wget http://download.opencontent.netflix.com.s3.amazonaws.com/AV1/Chimera/Old/Chimera-AV1-10bit-1920x1080-6191kbps.mp4
cd ffmpeg-4.2.1/
./configure --disable-zlib --disable-doc --prefix=`pwd`
make -j $(nproc --all)
make install
cd ../
./ffmpeg-4.2.1/bin/ffmpeg -i Stream2_AV1_HD_6.8mbps.webm -vcodec copy -an -f ivf summer_nature_1080p.ivf
./ffmpeg-4.2.1/bin/ffmpeg -i Stream2_AV1_4K_22.7mbps.webm -vcodec copy -an -f ivf summer_nature_4k.ivf
./ffmpeg-4.2.1/bin/ffmpeg -i Chimera-AV1-8bit-1920x1080-6736kbps.mp4 -vcodec copy -an -f ivf chimera_8b_1080p.ivf
./ffmpeg-4.2.1/bin/ffmpeg -i Chimera-AV1-10bit-1920x1080-6191kbps.mp4 -vcodec copy -an -f ivf chimera_10b_1080p.ivf
cd dav1d-0.5.0/
~/.local/bin/meson build --buildtype release
ninja -C build
cd ../
echo "#!/bin/bash
./dav1d-0.5.0/build/tools/dav1d -i \$1 --muxer null --framethreads \$(nproc --all) --tilethreads 4 --filmgrain 0" > dav1d
chmod +x dav1d
cd ../

echo "-------Downloading and installing cpuminer-opt"
mkdir cpuminer-opt && cd cpuminer-opt
wget http://www.phoronix-test-suite.com/benchmark-files/cpuminer-opt-3.8.8.1.zip 
unzip cpuminer-opt-3.8.8.1.zip && rm cpuminer-opt-3.8.8.1.zip
mv cpuminer-opt-3.8.8.1/* ./ && rm -rf cpuminer-opt-3.8.8.1
./autogen.sh 
CFLAGS="-O3 -march=native" ./configure --without-curl
make -j $(nproc --all)
echo "#!/bin/sh
./cpuminer --quiet --time-limit=30 --benchmark -a \$1" > cpuminer-opt
chmod +x cpuminer-opt
cd ../

echo "-------Downloading and installing libvpx"
git clone https://github.com/webmproject/libvpx.git
mv libvpx vpxenc && cd vpxenc 
./configure --disable-install-docs --disable-vp8 --enable-shared --prefix=`pwd`
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

echo "-------Downloading and installing deepspeech"
mkdir deepspeech && cd deepspeech
wget https://github.com/mozilla/DeepSpeech/releases/download/v0.6.0/deepspeech-0.6.0-models.tar.gz
tar -xf deepspeech-0.6.0-models.tar.gz && rm deepspeech-0.6.0-models.tar.gz
wget http://www.phoronix-test-suite.com/benchmark-files/sample-speech-1.tar.xz
tar -xf sample-speech-1.tar.xz && rm sample-speech-1.tar.xz
wget https://github.com/mozilla/DeepSpeech/releases/download/v0.6.0/native_client.amd64.cpu.linux.tar.xz
tar -xf native_client.amd64.cpu.linux.tar.xz && rm native_client.amd64.cpu.linux.tar.xz
mv deepspeech deepspeech-bin
echo "#!/bin/sh
./deepspeech-bin --model deepspeech-0.6.0-models/output_graph.pbmm --lm deepspeech-0.6.0-models/lm.binary \
--trie deepspeech-0.6.0-models/trie  --audio sample-speech-1.wav -t" > deepspeech
chmod +x deepspeech
cd ../

echo "-------Downloading and installing octave-benchmark"
mkdir octave-benchmark && cd octave-benchmark
wget http://www.phoronix-test-suite.com/benchmark-files/octave-benchmark-1.1.1.tar.gz
tar -xf octave-benchmark-1.1.1.tar.gz && rm octave-benchmark-1.1.1.tar.gz
mv benchmark-1.1.1/* ./ && rm -rf benchmark-1.1.1/
echo "#!/bin/bash
cd inst/
for filename in benchmark_*.m; do
        octave-cli \$filename
done" > octave-benchmark
chmod +x octave-benchmark
cd ../

echo "-------Downloading and installing build2"
mkdir build2 && cd build2
wget https://download.build2.org/0.12.0/build2-install-0.12.0.sh
wget https://download.build2.org/0.12.0/build2-toolchain-0.12.0.tar.xz
tar -xJf build2-toolchain-0.12.0.tar.xz && rm build2-toolchain-0.12.0.tar.xz
chmod +x build2-install-0.12.0.sh
echo "#!/bin/bash
rm -rf build2-toolchain-0.12.0
rm -rf t
mkdir t
./build2-install-0.12.0.sh --local --yes --no-check t" > build2
chmod +x build2
cd ../

echo "-------Downloading and installing build-gdb"
mkdir build-gdb && cd build-gdb
wget https://ftp.gnu.org/gnu/gdb/gdb-9.1.tar.xz
tar -xJf gdb-9.1.tar.xz && rm gdb-9.1.tar.xz
echo "#!/bin/sh
cd gdb-9.1/
mkdir build
cd build
../configure
make -s -j \$(nproc --all)" > build-gdb
chmod +x build-gdb
cd ../
