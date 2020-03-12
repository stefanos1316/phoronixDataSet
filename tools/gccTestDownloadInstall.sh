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

exit

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